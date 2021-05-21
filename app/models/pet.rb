class Pet < ApplicationRecord
  belongs_to :owner
  has_one_attached :image

  validates :care_instructions, presence: true
end
