class Room < ApplicationRecord
  belongs_to :airport
  has_many :messages, dependent: :destroy
  
  def last_1000_messages
    messages.order(created_at: :desc).limit(1000).reverse
  end
  
  def broadcast_message(message)
    ActionCable.server.broadcast("room_#{id}", {
      id: message.id,
      username: message.username,
      content: message.content,
      created_at: message.created_at.strftime("%H:%M")
    })
  end
end
