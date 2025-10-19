document.addEventListener('DOMContentLoaded', () => {
  const chatContainer = document.querySelector('[data-controller="chat"]');
  if (!chatContainer) return;

  const roomId = chatContainer.dataset.chatRoomIdValue;
  const messagesDiv = chatContainer.querySelector('[data-chat-target="messages"]');
  const form = chatContainer.querySelector('form');
  const usernameInput = form.querySelector('[name="username"]');
  const contentInput = form.querySelector('[name="content"]');

  const savedUsername = localStorage.getItem('chat_username');
  if (savedUsername) {
    usernameInput.value = savedUsername;
  }

  function scrollToBottom() {
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
  }

  function addMessage(data) {
    const messageHTML = `
      <div class="bg-white rounded-lg p-3 shadow-sm">
        <div class="flex items-baseline justify-between mb-1">
          <span class="font-semibold text-blue-600">${escapeHtml(data.username)}</span>
          <span class="text-xs text-gray-500">${data.created_at}</span>
        </div>
        <p class="text-gray-800">${escapeHtml(data.content)}</p>
      </div>
    `;
    messagesDiv.insertAdjacentHTML('beforeend', messageHTML);
    scrollToBottom();
  }

  function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
  }

  scrollToBottom();

  // WebSocket connection
  const protocol = window.location.protocol === 'https:' ? 'wss:' : 'ws:';
  const ws = new WebSocket(`${protocol}//${window.location.host}/cable`);
  
  ws.onopen = () => {
    console.log('WebSocket connected');
    ws.send(JSON.stringify({
      command: 'subscribe',
      identifier: JSON.stringify({ channel: 'RoomChannel', room_id: roomId })
    }));
  };

  ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    if (data.type === 'ping') return;
    if (data.message) {
      addMessage(data.message);
    }
  };

  ws.onerror = (error) => {
    console.error('WebSocket error:', error);
  };

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    e.stopPropagation();

    const username = usernameInput.value.trim();
    const content = contentInput.value.trim();

    if (!username || !content) return;

    localStorage.setItem('chat_username', username);

    const formData = new FormData();
    formData.append('username', username);
    formData.append('content', content);

    const csrfToken = document.querySelector('[name="csrf-token"]').content;

    try {
      await fetch(`/rooms/${roomId}/messages`, {
        method: 'POST',
        body: formData,
        headers: {
          'X-CSRF-Token': csrfToken
        }
      });

      contentInput.value = '';
      contentInput.focus();
    } catch (error) {
      console.error('Error sending message:', error);
      alert('Failed to send message. Please try again.');
    }

    return false;
  });
});
