import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "toggle"]

  connect() {
    this.closeOnDesktop()
    this.boundResize = this.closeOnDesktop.bind(this)
    window.addEventListener("resize", this.boundResize)
  }

  disconnect() {
    window.removeEventListener("resize", this.boundResize)
  }

  toggle() {
    this.menuTargets.forEach((menu) => menu.classList.toggle("is-open"))

    const expanded = this.toggleTarget.getAttribute("aria-expanded") === "true"
    this.toggleTarget.setAttribute("aria-expanded", expanded ? "false" : "true")
  }

  closeOnDesktop() {
    if (window.innerWidth > 980) {
      this.menuTargets.forEach((menu) => menu.classList.remove("is-open"))
      if (this.hasToggleTarget) this.toggleTarget.setAttribute("aria-expanded", "false")
    }
  }
}
