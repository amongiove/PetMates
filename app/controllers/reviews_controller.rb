class ReviewsController < ApplicationController

    def new
        puts "NEW"
        @user = User.find_by(id: session[:user_id])
        @sitter = Sitter.find_by(id: params[:sitter_id])
        if @user.type != "Owner"
            redirect_to sitters_path, notice: "You must be an Owner to leave a review."
        end
    end

    def create
        puts "CREATE"
        puts params
        binding.pry
        @review = Review.new(review_params)
        if @review.save
            redirect_to "/sitters/#{@sitter.id}"
        else
            redirect_to "/sitters/#{@sitter.id}", notice: "Unable to complete request." #TODO: make this more specific
        end
    end

    private

    def review_params 
        params.require(:review).permit(:sitter_id, :owner_id, :rating, :review)
    end

end