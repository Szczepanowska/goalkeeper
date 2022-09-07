import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "list" ]

  connect() {
  }

  mark(event) {
    event.preventDefault()
    // console.log(event)
    let goal = event.currentTarget.dataset.id
    // console.log(goal)
    let host = window.location.origin
    let icon = event.currentTarget.querySelector("i")
    console.log(icon)

    if (icon.classList.contains("fa-regular")) {
      let url = `${host}/goals/${goal}/bookmarks`
      icon.classList.remove("fa-regular")
      icon.classList.add("fa-solid")
      fetch(url, {
        method: "POST",
        headers: { "Accept": "text/html"}
      })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.listTarget.outerHTML = data
        // this.element.insertAdjacentHTML("beforebegin", data)
      })
    } else {
      let url = `${host}/goals/${goal}/bookmarks/${icon.dataset.bookmark}`
      icon.classList.remove("fa-solid")
      icon.classList.add("fa-regular")
      fetch(url, {
        method: "DELETE",
        headers: { "Accept": "text/html"}
      })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.listTarget.outerHTML = data
        // this.listTarget.insertAdjacentHTML("beforeend", data)
        // this.element.insertAdjacentHTML("beforebegin", data)
      })
    }

  }
}
