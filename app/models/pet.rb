class Pet < ApplicationRecord
  belongs_to :owner
  has_one_attached :image
  validates :care_instructions, presence: true, length: {maximum: 500}
  validate :acceptable_image

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 1.megabyte
      errors.add(:image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG")
    end
  end
end
