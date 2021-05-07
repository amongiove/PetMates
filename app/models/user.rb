class User < ApplicationRecord
    has_secure_password
    #has_many :jobs
    #has_many :reviews
    has_many :messages
    #before_create :set_user_type
    validates :name, presence: true
    validates :email, presence: true
 
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
