class Sitter < User 
    has_many :jobs
    has_many :owners, through: :jobs
    has_many :reviews

    def self.search(params)
        where("LOWER(city) LIKE ?", "%#{params}%")
    end

    def average_rating
        @sitters = Sitter.all
        @average_ratings = {}
        @Sitters.each do |sitter|
            @ratings = []
            sitter.reviews.each do |reivew|
                @ratings << reivew.rating
            end
        
            if sitter.reviews.empty?
                @average_ratings[sitter.id] = 0
            else
                @average_ratings[sitter.id] = ((@ratings.sum)/(@ratings.size).to_f)
            end
        end
    end

end