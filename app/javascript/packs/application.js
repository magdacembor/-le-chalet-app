// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import "bootstrap";
import { initAutocomplete } from '../plugins/init_autocomplete.js';
import { initMapbox } from '../plugins/init_mapbox';
import slick from 'slick-carousel'
import 'slick-carousel/slick/slick-theme.css'
import 'slick-carousel/slick/slick.css'

const carousel = () => {
  $('.carousel-styling').slick({
    centerMode: true,
      centerPadding: '300px',
      slidesToShow: 1,
      arrows: false,
      autoplay: true,
      dots: true,
      speed: 300
  });
}

document.addEventListener("turbolinks:load", () => {
  carousel();
  initAutocomplete();
  initMapbox();
});

