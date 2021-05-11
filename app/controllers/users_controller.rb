class UsersController < ApplicationController
    
    def new
    end

    def create
        #TODO: put verify pw and authenticate here
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
            
        else
            #TODO: fix flash messages so they are actual error messages
            render :new, flash.now[:notice] = @user.errors.full_messages.compact

        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :type_selection if @user.type.blank?
        render :owner_info if @user.type == "Owner"
        render :sitter_info if @user.type == "Sitter"
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        @user.save
        redirect_to user_path(@user), notice: "Profile Updated."
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

    def sitter_show #sitters_show
        @sitter = Sitter.find_by(id: params[:id])
        @rating = @sitter.average_rating
    end

    def show #owners_show
    end


    private 
  
    def user_params 
      params.require(:user).permit(:name, :password, :email, :type, :street_address, :city, :state, :zip, :phone_number, :home_access_info, :bio, :rate, :search, :image)
    end
end
