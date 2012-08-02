Modernizr.load
  load: '//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js'
  complete: =>
    Modernizr.load 'js/vendor/jquery-1.7.2.min.js' unless window.jQuery
,
  load: 'js/plugins.js'