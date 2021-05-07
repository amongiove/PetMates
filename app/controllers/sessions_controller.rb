class SessionsController < ApplicationController 


    def create
        user = User.find_by(email: params[:user][:email])
        @user = user.try(:authenticate, params[:user][:password])
        return redirect_to controller: 'welcome', action: 'home' unless @user
        session[:user_id] = user.id
        redirect_to user_path(@user)
    end

    def googleAuth
        #login and signup -- need to find a way to allow sitter/owner select
        # @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
        #     user.name= auth["info"]["first_name"]
        #     user.password= SecureRandom.hex(10)
        # end
        # if @user.save
        #     session[:user_id] = @user.id
        #     redirect_to user_path(@user)
        # else
        #     redirect_to '/'
        # end

        @user = User.find_by(email: auth["info"]["email"]) 
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            #flash message - please sign up as a sitter or owner 
            redirect_to '/'
        end
    end

    def destroy
        #TODO: add in prompt "are you sure" when click link
        session.delete :user_id
        redirect_to root_url
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end
end