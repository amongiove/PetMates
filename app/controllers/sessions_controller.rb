class SessionsController < ApplicationController 
    def new
        puts "SESSIONS NEW"
        render root_url
    end

    def create
        puts "SESSIONS CREATE"
        user = User.find_by(name: params[:user][:email])
        @user = user.try(:authenticate, params[:password])
        return redirect_to root_url unless @user
        session[:user_id] = user.id
        redirect_to @user    
    end

    # def destroy
    #     session.delete :user_id
    #     redirect_to root_url
    # end
        
end