class User < ApplicationRecord
    has_secure_password
    has_many :messages
    # TODO: want this validation but doesnt work with test oauth login (my google acct)
    #validates :password, length: { minimum: 6}
    validates :zip, length: {minimum: 5}, allow_nil: true
    validates :phone_number, length: {minimum: 10}, allow_nil: true
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, unless: :persisted?
    validates_format_of :email, {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
    has_one_attached :image
    after_initialize :set_defaults, unless: :persisted?
    validate :acceptable_image

  def set_defaults
    if self.type == "Sitter"
        self.rate = 0 if self.rate.blank?
    end
  end
 
    def onboarded?
        if self.type == "Owner"
            if !self.street_address.blank? && !self.city.blank? && !self.zip.blank? && !self.phone_number.blank? && !self.home_access_info.blank?
                return true
            else
                return false
            end
        end
        if self.type == "Sitter"
            if !self.street_address.blank? && !self.city.blank? && !self.zip.blank? && !self.phone_number.blank? && !self.bio.blank? && !self.rate.blank?
                return true
            else
                return false
            end
        end
    end

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
