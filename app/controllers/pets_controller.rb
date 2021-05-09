class PetsController < ApplicationController 

    #need this?
    def index
    end

    def new
        @owner = User.find_by(id: session[:user_id])
    end

    def create
        puts "CREATE"
        @owner = User.find_by(id: session[:user_id])
        @pet = Pet.new(pet_params)
        if @pet.save
            #redirect broken
            redirect_to owner_pet_path(@owner,@pet)
        else
            #TODO: fix flash messages so they are actual error messages
            render :new
        end
    end

    def show
        @pet = Pet.find_by(id: params[:id])
    end

    
    private 
  
    def pet_params 
      params.require(:pet).permit(:owner_id, :name, :pet_type, :breed, :color, :sex, :age, :care_instructions)
    end
    
    
end