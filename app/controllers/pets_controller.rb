class PetsController < ApplicationController 

    #TODO: refactor repeated @owner= and @pet= code

    def index
        @owner = User.find_by(id: session[:user_id])
        @pets = @owner.pets
    end

    def new
        @owner = User.find_by(id: session[:user_id])
    end

    def create
        @owner = User.find_by(id: session[:user_id])
        @pet = Pet.new(pet_params)
        if @pet.save
            redirect_to owner_pet_path(@owner, @pet)
        else
            flash.now[:notice] = "Oops, couldn't create pet profile. Please make sure you are using a valid informaiton and try again."
            render :new
        end
    end

    def show
        @user = User.find_by(id: session[:user_id])
        @owner = User.find_by(id: params[:owner_id])
        @pet = Pet.find_by(id: params[:id])
    end

    def edit
        @owner = User.find_by(id: session[:user_id])
        @pet = Pet.find_by(id: params[:id])
    end

    def update
        @owner = User.find_by(id: session[:user_id])
        @pet = Pet.find_by(id: params[:id])
        @pet.update(pet_params)
        @pet.save
        redirect_to owner_pet_path(@owner, @pet), notice: "#{@pet.name.calitalize}'s Profile Updated."
    end

    def destroy
        @owner = User.find_by(id: session[:user_id])
        @pet = Pet.find_by(id: params[:id])
        @pet.destroy
        redirect_to owner_pets_path(@owner)
    end


    private 
  
    def pet_params 
      params.require(:pet).permit(:owner_id, :name, :pet_type, :breed, :color, :sex, :age, :care_instructions, :image)
    end
    
    
end