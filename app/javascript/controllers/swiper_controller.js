import { Controller } from "@hotwired/stimulus"
import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs'

export default class extends Controller {
  connect() {
    this.swiper = new Swiper(this.element, {
      effect: 'cards',
      on: {
        slideChange: () => {
          const direction = this.swiper.activeIndex > this.swiper.previousIndex ? 'right' : 'left';
          const studied = direction === 'left';
          const vocabId = this.swiper.slides[this.swiper.activeIndex].dataset.vocabId
          // console.log(vocabId);

          fet
        },
      },
    });
  }
}
