class PetsController < ApplicationController 

    #need this?
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
            #redirect broken
            redirect_to owner_pet_path(@owner, @pet)
        else
            #TODO: fix flash messages so they are actual error messages
            render :new
        end
    end

    def show
        @owner = User.find_by(id: session[:user_id])
        @pet = Pet.find_by(id: params[:id])
    end

    def edit
        @owner = User.find_by(id: session[:user_id])
        @pet = Pet.find_by(id: params[:id])
    end

    def update
        @pet = Pet.find_by(id: params[:id])
        @pet.update(pet_params)
        @pet.save
        redirect_to owner_pet_path(@owner, @pet)
    end

    def destroy
        @owner = User.find_by(id: session[:user_id])
        @pet = Pet.find_by(id: params[:id])
        @pet.destroy
        redirect_to owner_pets_path(@owner)
    end


    private 
  
    def pet_params 
      params.require(:pet).permit(:owner_id, :name, :pet_type, :breed, :color, :sex, :age, :care_instructions)
    end
    
    
end