import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox"
export default class extends Controller {
  static targets = [ 'progress' ]
  static values = {
    tasks: Number
  }
  progressBar = 0
  tasks = (1 / Number(this.progressTarget.dataset.tasks))
  progress = Number(this.progressTarget.dataset.progress)
  status = 0


  connect() {
    console.log(this.progressTarget)
    console.log(this.progressTarget.dataset.tasks)
    console.log(this.progressTarget.style.width)
  }
  update(event) {
    let flash = document.querySelector('.alert-dismissible')
    if (flash) flash.remove()
    let host = window.location.origin
    let mark = event.currentTarget.dataset.complete === 'false' ? 'completed' : 'incomplete'
    event.currentTarget.dataset.complete = event.currentTarget.dataset.complete === 'false' ? 'true' : 'false'
    let url = `${host}/tasks/${event.currentTarget.id}/${mark}`
    // let tasks = (1 / Number(this.progressTarget.dataset.tasks))
    // let progress = Number(this.progressTarget.dataset.progress)
    this.progress = mark === 'completed' ? this.tasks + this.progress : this.progress - this.tasks
    // this.progressBar = newProgress
    let newValue = `${Math.round(this.progress * 100)}%`
    this.progressTarget.style.width = newValue
    this.progressTarget.innerText = newValue
    console.log(this.progress)


    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain"}
    })
    .then(response => response.text())
    .then((data) => {

      this.element.insertAdjacentHTML("beforebegin", data)
    })

    // location.reload();
  }
}
