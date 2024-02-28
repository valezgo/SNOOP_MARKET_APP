import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["card-body"];

  toggle() {
    this.bodyTarget.classList.toggle("d-none");
  }
}