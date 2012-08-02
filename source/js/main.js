Modernizr.load([
  {
    load: '//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js',
    complete: function () {
      if ( !window.jQuery ) {
        Modernizr.load('js/vendor/jquery-1.7.2.min.js');
      }
    }
  },
  {
    load: 'js/plugins.js',
    complete: function () {
      $('#slideshow').orbit({
        animation: 'horizontal-slide',
        animationSpeed: 960,
        resetTimerOnClick: true,
        pauseOnHover: true,
        startClockOnMouseOut: true,
        captionAnimation: 'slideOpen',
        bullets: true
      });
    }
  }
]);