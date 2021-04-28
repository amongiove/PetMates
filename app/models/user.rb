class User < ApplicationRecord
    has_many :jobs
    has_many :reviews
    has_many :messages
end
