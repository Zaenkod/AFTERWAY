import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-event"
export default class extends Controller {
  static targets = ["form", "input", "list", "button","host","invit", "guest","organizer"]

  update() {

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }

  fire() {
    if (this.buttonTarget.checked) {
    this.hostTarget.classList.toggle("d-none");
    this.invitTarget.classList.toggle("d-none");
    this.organizerTarget.classList.toggle("d-none");
    this.guestTarget.classList.toggle("d-none");
    } else {
    this.invitTarget.classList.toggle("d-none");
    this.hostTarget.classList.toggle("d-none");
    this.organizerTarget.classList.toggle("d-none");
    this.guestTarget.classList.toggle("d-none");
    }
  }
}
