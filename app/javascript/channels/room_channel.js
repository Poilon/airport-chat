import consumer from "./index"

let roomChannel = null

export function subscribeToRoom(roomId, onMessageReceived) {
  if (roomChannel) {
    roomChannel.unsubscribe()
  }

  roomChannel = consumer.subscriptions.create(
    { channel: "RoomChannel", room_id: roomId },
    {
      connected() {
        console.log("Connected to room", roomId)
      },

      disconnected() {
        console.log("Disconnected from room", roomId)
      },

      received(data) {
        onMessageReceived(data)
      }
    }
  )
}

export function unsubscribeFromRoom() {
  if (roomChannel) {
    roomChannel.unsubscribe()
    roomChannel = null
  }
}
