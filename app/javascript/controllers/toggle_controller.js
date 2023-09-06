import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "togglableCard", "map", "list"]

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.togglableCardTarget.classList.toggle("d-none");
    this.mapTarget.classList.toggle("d-none");
    this.listTarget.classList.toggle("d-none");
    window.map.resize()
  }
}
