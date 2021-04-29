class Owner < User
    has_many :pets
    has_many :jobs
    has_many :sitters, through: :jobs
    has_many :reviews
end