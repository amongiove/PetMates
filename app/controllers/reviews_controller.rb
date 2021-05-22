class ReviewsController < ApplicationController
    before_action :authorize
    
    def new
        @user = current_user
        @sitter = Sitter.find_by(id: params[:sitter_id])
        if @user.type != "Owner"
            redirect_to sitters_path, notice: "You must be an Owner to leave a review."
        end
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to "/sitters/#{params[:sitter_id]}", notice: "Review Saved."
        else
            redirect_to request.referrer, notice: "Oops! #{@review.errors.full_messages.to_sentence}. Please try again."
        end
    end

    private

    def review_params 
        params.require(:review).permit(:sitter_id, :owner_id, :review)
    end

end