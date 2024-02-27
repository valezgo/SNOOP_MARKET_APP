import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["body"];

  toggle() {
    this.bodyTarget.classList.toggle("d-none");
  }
}