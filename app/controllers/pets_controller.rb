class PetsController < ApplicationController 

    def show
        @owner = User.find_by(id: session[:user_id])
        redirect_to owner_pets_path(@owner)
    end

end