class Owner < User
    has_many :pets
    has_many :jobs
    has_many :sitters, through: :jobs
    has_many :reviews
    validates :home_access_info, presence: true, allow_nil: true, length: {maximum: 500}
end