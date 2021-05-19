class ApplicationController < ActionController::Base
    #TODO: need this stuff?
    # protect_from_forgery with: :exception

    # configure do
    #     set :views, "app/views"
    #     enable :sessions
    #     set :session_secret, "password_security"
    # end

    helper_method :current_user
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
      redirect_to root_path, notice: "You must be logged in to access this page." if current_user.nil?
    end
    
end
