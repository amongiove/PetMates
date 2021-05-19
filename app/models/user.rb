class User < ApplicationRecord
    has_secure_password
    has_many :messages
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    has_one_attached :image
    after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    if self.type == "Sitter"
        self.rate = 0 if self.acceptance_status.blank?
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

    
end
