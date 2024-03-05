import { Controller } from "@hotwired/stimulus"
import Hammer from "hammerjs";

export default class extends Controller {
  static targets = [ "swiperCard" ]

  static values = {
    vocab: Number
  }

  connect() {

  }
}
