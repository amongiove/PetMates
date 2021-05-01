class SessionsController < ApplicationController 
    # def new
    #     puts "SESSIONS NEW"
    #     render root_url
    # end

    def create
        puts "SESSIONS CREATE"
        user = User.find_by(email: params[:user][:email])
        @user = user.authenticate(params[:user][:password])
        if @user
            session[:user_id] = user.id
            redirect_to user_path(@user)
        else
            redirect_to root_url
        end    
    end

    # def destroy
    #     session.delete :user_id
    #     redirect_to root_url
    # end
        
end