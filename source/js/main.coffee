---
---



@addCommas = (nStr) ->
  nStr += ""
  x = nStr.split(".")
  x1 = x[0]
  x2 = (if x.length > 1 then "." + x[1] else "")
  rgx = /(\d+)(\d{3})/
  x1 = x1.replace(rgx, "$1" + "," + "$2")  while rgx.test(x1)
  x1 + x2



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