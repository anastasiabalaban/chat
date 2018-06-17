class Message < ApplicationRecord
  belongs_to :user
  after_create_commit :broadcast_message
  validates :body, presence: true, length: {minimum: 1, maximum: 1000}

  private

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end
end
