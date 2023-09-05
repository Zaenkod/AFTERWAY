import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    this.startTimeOut()
    this.hasTimeOut = true
  }

  startTimeOut() {
    if (this.hasTimeOut) { return }

    this.hasTimeOut = true
    this.timeout = setTimeout(() => {
      this.remove()
    }, 3000);
  }

  stopTimeout() {
    this.hasTimeOut = false
    clearTimeout(this.timeout)
  }

  remove() {
    this.element.classList.add('slide-right')
    setTimeout(() => {
      this.element.remove()
    }, 750);
  }
}
