import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer"
export default class extends Controller {
  static targets = ["accept", "decline", "reset"]
  static values = { eventId: Number, participantId: Number }

  connect() {
    console.log("Hello my friends");
    console.log(this.resetTarget);
    console.log(this.acceptTarget);
  }

  accept(evt){
    const status = evt.target.dataset.status

    const options = {
      method: 'PATCH',
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content
      }
    }

    fetch(`/events/${this.eventIdValue}/update_participant?status=${status}&participant_id=${this.participantIdValue}`, options)
    .then(response => response.json())
    .then((data) => {
      if (data.success) {
        this.declineTarget.classList.add("d-none");
        this.acceptTarget.innerText = "Accepted";
        console.log(data.success);
      } else {
        alert("Action failed, please try again")
      }
    })
  }

  decline(evt){
    const status = evt.target.dataset.status
    console.log(status);
    const options = {
      method: 'PATCH',
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content
      }
    }

    fetch(`/events/${this.eventIdValue}/update_participant?status=${status}&participant_id=${this.participantIdValue}`, options)
    .then(response => response.json())
    .then((data) => {
      if (data.success) {
        this.acceptTarget.classList.add("d-none");
        this.declineTarget.innerText = "Refused";
        console.log(status);
      } else {
        alert("Action failed, please try again")
      }
    })
  }


  reset(evt){
    const status = evt.target.dataset.status
    console.log(status);
    const options = {
      method: 'PATCH',
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content
      }
    }

    fetch(`/events/${this.eventIdValue}/update_participant?status=${status}&participant_id=${this.participantIdValue}`, options)
    .then(response => response.json())
    .then((data) => {
      if (data.success) {
        this.acceptTarget.classList.remove("d-none");
        this.declineTarget.classList.remove("d-none");
        console.log(status);
      } else {
        alert("Action failed, please try again")
      }
    })
  }
}
