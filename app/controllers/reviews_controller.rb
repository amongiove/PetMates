class ReviewsController < ApplicationController

    def new
        @user = current_user
        @sitter = Sitter.find_by(id: params[:sitter_id])
        if @user.type != "Owner"
            redirect_to sitters_path, notice: "You must be an Owner to leave a review."
        end
       #TODO: limit # of reviews to 1 per person per sitter? 
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to "/sitters/#{params[:sitter_id]}"
        else
            redirect_to "/sitters/#{params[:sitter_id]}", notice: "Oops, unable to submit this refiew. Please make sure you are using a valid information and try again." 
        end
    end

    private

    def review_params 
        params.require(:review).permit(:sitter_id, :owner_id, :review)
    end

end