class Message < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :content, presence: true

  def time_sent
    time_sent = self.created_at
    time_sent = time_sent.strftime("%b %e, %Y %l:%M %p")
  end
end
