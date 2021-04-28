class Review < ApplicationRecord
  belongs_to :sitter
  belongs_to :owner
end
