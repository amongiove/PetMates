class SessionsController < ApplicationController 

    def create
        user = User.find_by(email: params[:user][:email].downcase)
        @user = user.try(:authenticate, params[:user][:password])
        if @user 
            session[:user_id] = user.id
            redirect_to user_path(@user), notice: 'Successfully logged in!'
        else
            redirect_to root_path, notice: "Incorrect email and/or password, please try again."
        end
    end

    def googleAuth
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.name= auth["info"]["first_name"]
            user.password= SecureRandom.hex(10)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/', notice: "Oops, couldn't login to this account. Please make sure you are using a valid email and password and try again."
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_url, notice: "Logged Out!"
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end
end