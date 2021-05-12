class ReviewsController < ApplicationController

    def new
        @user = User.find_by(id: session[:user_id])
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
            redirect_to "/sitters/#{params[:sitter_id]}", notice: "Unable to submit review." #TODO: make this more specific
        end
    end

    private

    def review_params 
        params.require(:review).permit(:sitter_id, :owner_id, :review)
    end

end