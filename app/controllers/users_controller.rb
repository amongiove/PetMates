class UsersController < ApplicationController
    before_action :authorize, only: [:edit, :update, :search_sitters, :sitter_show, :owner_show]
  
    
    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @user.email.downcase!
            session[:user_id] = @user.id
            flash[:notice] = "Account created successfully!"
            redirect_to user_path(@user)
            
        else
            flash.now[:notice] = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
            render :new
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :type_selection if @user.type.blank?
        #TODO need to fix center style on this page - check with carl email
        render :owner_info if @user.type == "Owner"
        render :sitter_info if @user.type == "Sitter"
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        @user.save
        redirect_to user_path(@user), notice: "Profile successfully updated."
    end

    def search_sitters
    @sitters = Sitter.all
    if params[:search] && !params[:search].empty?
        @sitters = Sitter.search(params[:search].downcase)
        if @sitters.empty?
            @sitters = Sitter.all
            flash.now[:notice] = "Sorry. We could not find any Sitters located in #{params[:search].capitalize}."
        end
    end
       
    end

    def sitter_show 
        @sitter = Sitter.find_by(id: params[:id])
        @user = current_user
    end

    def owner_show 
        @owner = Owner.find_by(id: params[:id])
    end


    private 
  
    def user_params 
      params.require(:user).permit(:name, :password, :password_confirmation, :email, :type, :street_address, :city, :state, :zip, :phone_number, :home_access_info, :bio, :rate, :search, :image)
    end
end
