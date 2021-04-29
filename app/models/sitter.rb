class Sitter < User 
    has_many :jobs
    has_many :owners, through: :jobs
    has_many :reviews
end