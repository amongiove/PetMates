class User < ApplicationRecord
    has_secure_password
    has_many :messages
    # TODO: want this validation but doesnt work with test oauth login (my google acct)
    #validates :password, length: { minimum: 6}
    validates :zip, length: {minimum: 5}
    #TODO: still updates without changing this -- add error message
    validates :phone_number, length: {minimum: 10}
    #TODO: still updates without changing this -- add error message
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    has_one_attached :image
    after_initialize :set_defaults, unless: :persisted?
    #TODO: validate email format and phone number 

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
