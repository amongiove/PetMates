class Sitter < User 
 has_many :owners, through: :jobs
end