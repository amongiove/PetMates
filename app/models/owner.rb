class Owner < User
    has_many :pets
    has_many :sitters, through: :jobs
end