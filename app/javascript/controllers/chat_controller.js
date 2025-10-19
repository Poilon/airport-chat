import { Controller } from "@hotwired/stimulus"
import { subscribeToRoom, unsubscribeFromRoom } from "../channels/room_channel"

export default class extends Controller {
  static targets = ["messages", "message", "username", "form"]
  static values = { roomId: Number }

  connect() {
    this.scrollToBottom()
    
    subscribeToRoom(this.roomIdValue, (data) => {
      this.addMessage(data)
    })

    const savedUsername = localStorage.getItem("chat_username")
    if (savedUsername) {
      this.usernameTarget.value = savedUsername
    }
  }

  disconnect() {
    unsubscribeFromRoom()
  }

  async sendMessage(event) {
    event.preventDefault()
    event.stopPropagation()
    
    const username = this.usernameTarget.value.trim()
    const content = this.messageTarget.value.trim()
    
    if (!username || !content) return

    localStorage.setItem("chat_username", username)

    const url = this.formTarget.dataset.roomUrl
    const formData = new FormData()
    formData.append('username', username)
    formData.append('content', content)
    
    try {
      await fetch(url, {
        method: "POST",
        body: formData,
        headers: {
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
        }
      })
      
      this.messageTarget.value = ""
      this.messageTarget.focus()
    } catch (error) {
      console.error("Error sending message:", error)
      alert("Failed to send message. Please try again.")
    }
    
    return false
  }

  addMessage(data) {
    const messageHTML = `
      <div class="bg-white rounded-lg p-3 shadow-sm">
        <div class="flex items-baseline justify-between mb-1">
          <span class="font-semibold text-blue-600">${this.escapeHtml(data.username)}</span>
          <span class="text-xs text-gray-500">${data.created_at}</span>
        </div>
        <p class="text-gray-800">${this.escapeHtml(data.content)}</p>
      </div>
    `
    
    this.messagesTarget.insertAdjacentHTML("beforeend", messageHTML)
    this.scrollToBottom()
  }

  scrollToBottom() {
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }

  escapeHtml(text) {
    const div = document.createElement("div")
    div.textContent = text
    return div.innerHTML
  }
}
