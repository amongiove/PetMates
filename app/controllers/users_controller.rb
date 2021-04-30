class UsersController < ApplicationController
    
    def type_selection
    end

    def new
    end

    def create
        puts "PARAMS"
        puts params
        # @user = User.new(user_params)
        # if @user.save
            # session[:user_id] = @user.id
            # redirect_to @user
        # else
             render :new
        # end
    end

    private 
  
    def user_params 
      params.require(:user).permit(:name, :password, :email, :type, :street_address, :city, :state, :zip, :phone_number, :home_access_info, :bio, :rate)
    end
end
