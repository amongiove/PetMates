class Sitter < User 
    has_many :jobs
    has_many :owners, through: :jobs
    has_many :reviews
    validates :bio, presence: true, allow_nil: true, length: {maximum: 500}
    validates :rate, presence: true, allow_nil: true, numericality: {less_than_or_equal_to: 999}

    def self.search(params)
        where("LOWER(city) LIKE ?", "%#{params}%")
    end

    def pending?
        if 
            self.jobs.where("acceptance_status" => "Pending")
            return true
        else
            return false
        end
    end

end