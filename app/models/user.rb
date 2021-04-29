class User < ApplicationRecord
    has_secure_password
    #has_many :jobs
    #has_many :reviews
    has_many :messages
    #before_create :set_user_type
end
