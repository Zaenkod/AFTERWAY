import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="book-button"
export default class extends Controller {
  static targets = ["book", "unbook"]

  connect() {
  }

  booked(){
    this.bookTarget.innerText = "Booked 🎊";
    this.bookTarget.classList.remove("btn-small-blue");
    this.bookTarget.classList.add("btn", "btn-success");
    this.unbookTarget.hidden = false
  }

  unbooked() {
    this.bookTarget.innerText = "Book 🎊";
    this.bookTarget.classList.add("btn-small-blue");
    this.bookTarget.classList.remove("btn", "btn-success");
    this.unbookTarget.hidden = true
  }
}
