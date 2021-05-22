class Sitter < User 
    has_many :jobs
    has_many :owners, through: :jobs
    has_many :reviews
    validates :bio, presence: true, allow_nil: true

    def self.search(params)
        where("LOWER(city) LIKE ?", "%#{params}%")
    end

    def pending?
        self.jobs.where("acceptance_status" => "Pending")
    end

end