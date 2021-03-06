class UsersController < ApplicationController
    before_action :authorize, except: [:new, :create]
  
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
        puts 'start update'
        @user = User.find_by(id: params[:id])
        if @user == current_user
            render :type_selection if @user.type.blank?
            render :owner_info if @user.type == "Owner"
            render :sitter_info if @user.type == "Sitter"
        else
            flash[:notice] = "Oops, you do not have access to other User's information."
            redirect_to user_path(current_user)
        end
    end

    def update
        puts 'start update'
        @user = User.find_by(id: params[:id])
        puts @user
        puts user_params
        @user.update(user_params)
        if @user.errors.any?
            redirect_to user_path(@user), notice: "#{@user.errors.full_messages.to_sentence}."
        else
            @user.save
            redirect_to user_path(@user), notice: "Profile successfully updated."
        end
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
