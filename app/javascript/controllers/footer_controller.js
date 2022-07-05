
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropup", "dropsearch"]
  clickdropupMenu(event) {
      console.log("click")

      this.dropupTarget.classList.toggle("clickdropupMenu")

    }

  };
