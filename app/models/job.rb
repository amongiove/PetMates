class Job < ApplicationRecord
  belongs_to :sitter
  belongs_to :owner
  has_many :messages
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.acceptance_status = "pending" if self.acceptance_status.blank?
    self.completion_status = false if self.completion_status.blank?
  end

  def datetime
    datetime = self.date_time
    binding.pry
    datetime = datetime.strftime("%A, %d %b %Y %l:%M %p")
    return datetime
  end

end
