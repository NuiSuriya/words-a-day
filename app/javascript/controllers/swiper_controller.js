import { Controller } from "@hotwired/stimulus"
import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs'

export default class extends Controller {
  connect() {
    this.swiper = new Swiper(this.element, {
      effect: 'cards',
      on: {
        slideChange: () => {
          // console.log('Slide changed');
          console.log(this.swiper.activeIndex);
        },
      },
    });
  }
}
