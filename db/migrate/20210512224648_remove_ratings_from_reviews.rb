class RemoveRatingsFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column(:reviews, :rating)
  end
end
