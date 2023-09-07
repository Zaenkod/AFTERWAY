import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer"
export default class extends Controller {
  static targets = ["accept", "decline", "reset","accepted","refused"]
  static values = { eventId: Number, participantId: Number }

  connect() {
    console.log("Hello my friends");
    console.log(this.hasResetTarget, (this.resetTarget));
  }

  accept(evt){
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
        if (this.hasDeclineTarget) this.declineTarget.classList.add("d-none");
        if (this.hasAcceptTarget) this.acceptTarget.classList.add("d-none");
        if (this.hasAcceptedTarget) this.acceptedTarget.classList.remove("d-none");
        if (this.hasResetTarget) this.resetTarget.classList.remove("d-none");
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
        if (this.hasRefusedTarget) this.refusedTarget.classList.remove("d-none");
        if (this.hasAcceptTarget) this.acceptTarget.classList.add("d-none");
        if (this.hasDeclineTarget) this.declineTarget.classList.add("d-none");
        if (this.hasResetTarget) this.resetTarget.classList.remove("d-none");
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
        if (this.hasAcceptedTarget) this.acceptedTarget.classList.add("d-none");
        if (this.hasRefusedTarget) this.refusedTarget.classList.add("d-none");
        if (this.hasResetTarget) this.resetTarget.classList.add("d-none");
        if (this.hasAcceptTarget) this.acceptTarget.classList.remove("d-none");
        if (this.hasDeclineTarget) this.declineTarget.classList.remove("d-none");
        console.log(status);
      } else {
        alert("Action failed, please try again")
      }
    })
  }
}
