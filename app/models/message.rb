class Message < ApplicationRecord
  belongs_to :room
  
  validates :username, presence: true
  validates :content, presence: true
  
  after_create_commit :broadcast_message
  after_create_commit :cleanup_old_messages
  
  private
  
  def broadcast_message
    room.broadcast_message(self)
  end
  
  def cleanup_old_messages
    old_messages = room.messages.order(created_at: :asc).offset(1000)
    old_messages.destroy_all if old_messages.any?
  end
end
