import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-event"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log(this.buttonTarget)
  }
}
