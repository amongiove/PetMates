class UsersController < ApplicationController
    
    def type_selection
    end

    def new
        type = params["type"]
        if type == "Owner"
            render :owner_new
        else
            render :sitter_new
        end
    end

    def create
      
        # @user = User.new(user_params)
        # if @user.save
            # session[:user_id] = @user.id
            # redirect_to @user
        # else
            #  render :new
        # end
    end

    private 
  
    def user_params 
      params.require(:user).permit(:name, :password, :email, :type, :street_address, :city, :state, :zip, :phone_number, :home_access_info, :bio, :rate, :verify_password)
    end
end
