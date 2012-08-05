Modernizr.load
  load: '//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js'
  complete: =>
    Modernizr.load 'js/vendor/jquery-1.7.2.min.js' unless window.jQuery
,
  load: 'js/plugins.js'



htmlEncode = (->
  entities =
    "&": "&amp;"
    "<": "&lt;"
    "\"": "&quot;"
  (value) ->
    value.replace /[&<"]/g, (c) ->
      entities[c]
)()



# iOS scaling bug fix
# Rewritten version
# By @mathias, @cheeaun and @jdalton
# Source url: https://gist.github.com/901295
((doc) ->
  fix = ->
    meta.content = "width=device-width,minimum-scale=#{ scales[0] },maximum-scale=#{ scales[1] }"
    doc.removeEventListener type, fix, true
  addEvent = "addEventListener"
  type = "gesturestart"
  qsa = "querySelectorAll"
  scales = [1, 1]
  meta = (if qsa of doc then doc[qsa]("meta[name=viewport]") else [])
  if (meta = meta[meta.length - 1]) and addEvent of doc
    fix()
    scales = [0.25, 1.6]
    doc[addEvent] type, fix, true
) document