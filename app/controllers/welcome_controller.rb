class WelcomeController < ApplicationController

    def home
        @user = User.new
    end
end