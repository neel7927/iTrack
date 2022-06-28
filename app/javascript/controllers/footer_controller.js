
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropup", "dropsearch"]
  clickdropupMenu(event) {
      console.log("click")

      this.dropupTarget.classList.toggle("clickdropupMenu")

    }

    clickSearch(event) {
      event.preventDefault();
      document.querySelector(".search-div").classList.toggle("hide");
      console.log(document.querySelector(".search-div").classList);
      // this.dropsearchTarget.classList.toggle("clickSearch")

    }


  };
