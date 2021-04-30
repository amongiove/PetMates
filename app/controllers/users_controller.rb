class UsersController < ApplicationController
    
    def new
    end

    def create
        #TODO: put verify pw and authenticate here
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to onboarding_path(@user)
            
        else
            #TODO: fix flash messages so they are actual error messages
            flash[:message] = @user.errors.full_messages.compact
            render :new
        end
    end

     def user_profile
        @user = User.find_by(id: params[:format])
        render :owner_info if @user.type == "Owner"
        render :sitter_info if @user.type == "Sitter"
    end


    private 
  
    def user_params 
      params.require(:user).permit(:name, :password, :email, :type, :street_address, :city, :state, :zip, :phone_number, :home_access_info, :bio, :rate)
    end
end
