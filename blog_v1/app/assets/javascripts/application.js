// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var slideshow = {
  /* [THE OPTIONS] */
  delay: 8000, // time in between each slide

  /* [THE MECHANICS] */
  container: null, // HTML slides container
  caption: null, // HTML caption container
  slides: [], // array to hold all the slide data
  current: 0, // pointer, the current slide
  timer: null, // to hold the timer object

  start: function () {
  // slideshow.start() : start the slideshow

    // GET THE ELEMENTS
    slideshow.container = document.getElementById("slides");
    slideshow.caption = document.getElementById("slide-caption");

    // GET ALL SLIDES DATA
    let all = slideshow.container.getElementsByTagName("img");
    if (all.length>0) {
      for (let slide of all) {
        slideshow.slides.push({
          src : slide.src,
          caption : slide.dataset.caption
        });
      }

      // ATTACH NEXT/PREVIOUS BUTTONS
      document.getElementById("slide-left").addEventListener("click", slideshow.prev);
      document.getElementById("slide-right").addEventListener("click", slideshow.next);

      // START ROLLING
      slideshow.draw();
    }
  },

  draw: function () {
  // slideshow.draw() : draw current slide + prime timer

    // CREATE SLIDE
    var next = document.createElement("img");
    next.src = slideshow.slides[slideshow.current].src;
    next.classList.add("ninja");
    slideshow.container.innerHTML = "";
    slideshow.container.appendChild(next);

    // SILLY BUG. DIRECTY REMOVING THE CLASS WILL NOT FIRE THE CSS ANIMATION
    // WILL HAVE TO WAIT FOR A SPLIT SECOND TO PROPERLY RUN THE ANIMATION
    setTimeout(function(){
      next.classList.remove("ninja");
    }, 1);

    // SET CAPTION
    slideshow.caption.innerHTML = slideshow.slides[slideshow.current].caption;

    // SET TIMER FOR NEXT SLIDE
    slideshow.timer = setTimeout(slideshow.next, slideshow.delay);
  },

  next: function () {
  // slideshow.next() : go to next slide
 
    // CLEAR OLD TIMER FIRST
    if (slideshow.timer != null) {
      clearTimeout(slideshow.timer);
      slideshow.timer = null;
    }
 
    // TO THE NEXT SLIDE
    slideshow.current++;
 
    // ENDED - ROTATE BACK TO THE FIRST SLIDE
    if (slideshow.current == slideshow.slides.length) {
      slideshow.current = 0;
    }
    slideshow.draw();
  },

  prev: function () {
  // slideshow.prev() : go to last slide
 
    // CLEAR OLD TIMER FIRST
    if (slideshow.timer != null) {
      clearTimeout(slideshow.timer);
      slideshow.timer = null;
    }
 
    // TO THE NEXT SLIDE
    slideshow.current--;
 
    // ENDED - ROTATE BACK TO THE FIRST SLIDE
    if (slideshow.current <0 ) {
      slideshow.current = slideshow.slides.length - 1;
    }
    slideshow.draw();
  }
};

// FIRE UP SLIDE SHOW ON PAGE LOAD
window.addEventListener("load", slideshow.start);