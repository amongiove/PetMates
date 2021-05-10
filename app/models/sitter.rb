class Sitter < User 
    has_many :jobs
    has_many :owners, through: :jobs
    has_many :reviews

    def self.search(params)
        where("LOWER(city) LIKE ?", "%#{params}%")
    end

    def average_rating
        @ratings = []
        self.reviews.each do |reivew|
            @ratings << reivew.rating
        end
    
        if self.reviews.empty?
            return 0
        else
            average_rating = ((@ratings.sum)/(@ratings.size).to_f)
            return average_rating
        end
    end

end