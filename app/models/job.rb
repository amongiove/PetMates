class Job < ApplicationRecord
  belongs_to :sitter
  belongs_to :owner
  has_many :messages
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.acceptance_status = "Pending" if self.acceptance_status.blank?
    self.completion_status = false if self.completion_status.blank?
  end

  def datetime
    datetime = self.date_time
    datetime = datetime.strftime("%A, %B %e, %Y at %l:%M %p")
  end

  def completed?
    if self.completion_status == false
      return "Incomplete"
    end
    if self.completion_status == true
      return "Complete"
    end
  end

  def accepted?
    return nil unless self.acceptance_status == "Accepted"
  end
     
end
