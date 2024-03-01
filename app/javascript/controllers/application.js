import { Application } from "@hotwired/stimulus"

const application = Application.start()
application.register("card-body", CardController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
