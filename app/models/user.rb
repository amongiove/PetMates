class User < ApplicationRecord
    has_secure_password
    #has_many :jobs
    #has_many :reviews
    has_many :messages
    #before_create :set_user_type
    validates :name, presence: true
    validates :email, presence: true
    validates :type, presence: true
 
    def onboarded?
        if self.type == "Owner"
            if !self.street_address.empty? && !self.city.empty? && !self.zip.empty? && !self.phone_number.empty? && !self.home_access_info.empty?
                return true
            else
                return false
            end
        end
        if self.type == "Sitter"
            if !self.street_address.empty? && !self.city.empty? && !self.zip.empty? && !self.phone_number.empty? && !self.bio.empty? && !self.rate.empty?
                return true
            else
                return false
            end
        end
    end

end
