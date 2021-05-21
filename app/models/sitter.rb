class Sitter < User 
    has_many :jobs
    has_many :owners, through: :jobs
    has_many :reviews
    # validates :bio, length: {minimum: 1}

    def self.search(params)
        where("LOWER(city) LIKE ?", "%#{params}%")
    end

    def pending?
        self.jobs.where("acceptance_status" => "Pending")
    end

end