class Review < ApplicationRecord
  belongs_to :sitter
  belongs_to :owner
  validates :review, presence: true
end
