class SessionsController < ApplicationController 
    
    def create
        user = User.find_by(email: params[:user][:email])
        @user = user.try(:authenticate, params[:user][:password])
        return redirect_to controller: 'welcome', action: 'home' unless @user
        session[:user_id] = user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete :user_id
        redirect_to root_url
    end
        
end