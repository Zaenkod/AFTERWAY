import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notifications-subscription"
export default class extends Controller {
  static targets = ['counter']
  static values = {
    userId: Number
  }
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationsChannel", id: this.userIdValue },
      { received: data => this.handleNotification(data)}
    )
    console.log(`Subscribed to the notifications channel with the id ${this.userIdValue}.`)
  }

  handleNotification(data) {
    if (this.counterTarget.classList.contains('d-none')) {
      this.counterTarget.innerText = '1';
      this.counterTarget.classList.remove('d-none');
    } else {
      this.counterTarget.innerText = parseInt(this.counterTarget.innerText) + 1;
    }
  }
}
