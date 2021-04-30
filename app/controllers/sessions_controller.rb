class SessionsController < ApplicationController 
    def new
        puts "SESSIONS NEW"
        render root_url
    end

    def create
        puts "SESSIONS CREATE"
        user = User.find_by(name: params[:user][:name])
        @user = user.try(:authenticate, params[:password])
        return redirect_to root_url unless @user
        session[:user_id] = user.id
        redirect_to onboarding_path(@user)    
    end

    # def destroy
    #     session.delete :user_id
    #     redirect_to root_url
    # end
        
end