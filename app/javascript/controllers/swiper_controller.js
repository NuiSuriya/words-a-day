import { Controller } from "@hotwired/stimulus"
import Hammer from "hammerjs";

export default class extends Controller {
  static targets = ["swiperCard", "nope", "love"]

  connect() {
    this.allCards = this.swiperCardTargets;
    this.nope = this.nopeTarget;
    this.love = this.loveTarget;

    this.initCards();
    this.createButtonListener();

    console.log("Swiper connected");
  }

  initCards() {
    this.allCards.forEach((card, index) => {
      card.style.zIndex = this.allCards.length - index;
      card.style.transform = `scale(${(20 - index) / 20}) translateY(-${30 * index}px)`;
      card.style.opacity = (10 - index) / 10;

      let hammertime = new Hammer(card);

      hammertime.on('pan', (event) => {
        card.classList.add('moving');
      });

      hammertime.on('panend', (event) => {
        card.classList.remove('moving');
        let moveOutWidth = document.body.clientWidth;
        let keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

        if (!keep) {
          let endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
          let toX = event.deltaX > 0 ? endX : -endX;
          let endY = Math.abs(event.velocityY) * moveOutWidth;
          let toY = event.deltaY > 0 ? endY : -endY;
          let xMulti = event.deltaX * 0.03;
          let yMulti = event.deltaY / 80;
          let rotate = xMulti * yMulti;

          event.target.style.transform = `translate(${toX}px, ${toY + event.deltaY}px) rotate(${rotate}deg)`;
          this.initCards();
        }
      });
    });

    this.element.classList.add('loaded');
  }

  createButtonListener() {
    this.nope.addEventListener('click', (event) => {
      this.buttonListener(event, false);
    });

    this.love.addEventListener('click', (event) => {
      this.buttonListener(event, true);
    });
  }

  buttonListener(event, love) {
    let cards = this.swiperCardTargets.filter(card => !card.classList.contains('removed'));
    let moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    let card = cards[0];

    card.classList.add('removed');

    if (love) {
      card.style.transform = `translate(${moveOutWidth}px, -100px) rotate(-30deg)`;
    } else {
      card.style.transform = `translate(-${moveOutWidth}px, -100px) rotate(30deg)`;
    }

    this.initCards();

    event.preventDefault();
  }
}
