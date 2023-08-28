import consumer from "./consumer"

consumer.subscriptions.create("FriendRequestChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const notificationDisplay = document.querySelector('#notification-display')
    notificationDisplay.insertAdjacentHTML('afterbegin', this.template(data))
  },


  template(data) {
    return `<div class="message-header">
              <p>${data.user.email} sent you a friend request!</p>
            </div>`
  }
});
