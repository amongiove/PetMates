class PetsController < ApplicationController 
    before_action :authorize
    #TODO: refactor repeated @pet= code

    def index
        @owner = current_user
        @pets = @owner.pets
    end

    def new
        @owner = current_user
    end

    def create
        @owner = current_user
        @pet = Pet.new(pet_params)
        if @pet.save
            redirect_to owner_pet_path(@owner, @pet)
        else
            flash.now[:notice] = "Oops, couldn't create pet profile. Please make sure you are using a valid informaiton and try again."
            render :new
        end
    end

    def show
        @user = current_user
        @owner = User.find_by(id: params[:owner_id])
        @pet = Pet.find_by(id: params[:id])
    end

    def edit
        @owner = current_user
        @pet = Pet.find_by(id: params[:id])
    end

    def update
        @owner = current_user
        @pet = Pet.find_by(id: params[:id])
        @pet.update(pet_params)
        if @pet.errors.any?
            redirect_to owner_pet_path(@owner, @pet), notice: "#{@pet.errors.full_messages.to_sentence}."
        else
            @pet.save
            redirect_to owner_pet_path(@owner, @pet), notice: "Profile successfully updated."
        end
    end

    def destroy
        @owner = current_user
        @pet = Pet.find_by(id: params[:id])
        @pet.destroy
        redirect_to owner_pets_path(@owner)
    end

    private 
  
    def pet_params 
      params.require(:pet).permit(:owner_id, :name, :pet_type, :breed, :color, :sex, :age, :care_instructions, :image)
    end
    
    
end