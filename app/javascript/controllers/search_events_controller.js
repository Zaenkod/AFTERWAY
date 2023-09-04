import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-event"
export default class extends Controller {
  static targets = ["form", "input", "list", "button","host","invit"]

  connect() {
    console.log(this.buttonTarget)
    console.log(this.hostTarget)
    console.log(this.invitTarget);
  }

  update() {

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.listTarget.outerHTML = data;
      })
  }

  button(event) {
   if (this.buttonTarget.checked) {
    console.log(this.invitTarget);
   } else {
    console.log(this.hostTarget);
   }
  }
}
