import { Application } from "@hotwired/stimulus"
import CardController from "../controllers/item_card_controller.js";


const application = Application.start()
application.register("card-body", CardController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
