import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateProgressBar() {
    if (this.element.style.width > "100%") {
      this.element.classList.add("navbar-lewagon-white")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
    }
  };
}
