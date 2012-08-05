plug = (->
  addMobileNav: ->
    mainNav = $("ul.main-navigation, ul[role=main-navigation]").before("<fieldset class=\"mobile-nav\">")
    mobileNav = $("fieldset.mobile-nav").append("<select>")
    mobileNav.find("select").append "<option value=\"\">Navigate&hellip;</option>"
    addOption = ->
      mobileNav.find("select").append "<option value=\"" + @href + "\">&raquo; " + $(this).text() + "</option>"

    mainNav.find("a").each addOption
    $("ul.subscription a").each addOption
    mobileNav.find("select").bind "change", (event) ->
      window.location.href = event.target.value  if event.target.value


  testFeature: (features) ->
    getTestClasses = (tests) ->
      classes = ""
      if typeof (tests.join) is "function"
        i = 0

        while i < features.length
          classes += getClass(features[i]) + " "
          i++
      else
        classes = getClass(tests)
      classes

    getClass = (test) ->
      ((if Modernizr.testAllProps(test) then test else "no-" + test)).toLowerCase()

    $("html").addClass getTestClasses(features)

)()



Modernizr.load
  load: '//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js'
  complete: =>
    Modernizr.load 'js/vendor/jquery-1.7.2.min.js' unless window.jQuery
,
  load: 'js/plugins.js'
  complete: =>
    $(document).ready ->
      plug.testFeature ["maskImage", "transform"]
      plug.addMobileNav()



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