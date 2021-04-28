class Job < ApplicationRecord
  belongs_to :sitter
  belongs_to :owner
  has_many :messages
end
