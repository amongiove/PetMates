class Job < ApplicationRecord
  belongs_to :sitter
  belongs_to :owner
  has_many :messages
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.acceptance_status = "pending" if self.acceptance_status.blank?
    self.completion_status = false if self.completion_status.blank?
  end

  
end
