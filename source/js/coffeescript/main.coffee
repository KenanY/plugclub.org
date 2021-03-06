addCommas = (nStr) ->
  nStr += ''
  x = nStr.split('.')
  x1 = x[0]
  x2 = ''
  if x.length > 1
    x2 = '.' + x[1]
  rgx = /(\d+)(\d{3})/
  while rgx.test(x1)
    x1 = x1.replace(rgx, '$1' + ',' + '$2')
  return x1 + x2

formatNumber = (num) ->
  return addCommas(num.toFixed(0))

getRandomInt = (min, max) ->
  # Math.floor(Math.random() * (max - min + 1)) + min
  intRandom = new Alea ""
  Math.floor(intRandom() * (max - min + 1)) + min

cobbleLoop = ->
  incrementBy = getRandomInt 1, 128
  curNum = $('#cobble').html()
  curNum = curNum.replace /\,/g, ''
  curNum = parseInt(curNum, 10)
  newNum = curNum + incrementBy
  $('#cobble').html(formatNumber(newNum))



# This code runs only on the index page, where the cobblestone counter is
$.fayer.on
  "page-index": ->
    $(document).ready(->
      setInterval(cobbleLoop, 3000)
    )



# This runs on any page
$(document).ready(->
  $(document).foundationAlerts()
  $(document).foundationButtons()
  $(document).foundationAccordion()
  $(document).foundationNavigation()
  $(document).foundationCustomForms()
  $(document).foundationMediaQueryViewer()
  $(document).foundationTabs {callback: $.foundation.customForms.appendCustomMarkup}
  $(document).tooltips()
  $('input, textarea').placeholder()
  $.ajax
    url: "https://api.github.com/repos/KenanY/plugclub.org/commits",
    dataType: 'jsonp',
    success: (json) ->
      latest = json.data[0]
      $('a.commit').html "#{ latest.sha.substring(0, 7) }"
      $('a.commit').attr 'href', "https://github.com/KenanY/plugclub.org/commit/#{ latest.sha }"
      $('a.commit').attr 'title', "#{ latest.commit.message }"
  if Modernizr.touch
    MBP.scaleFix()
    MBP.hideUrlBar()
)



htmlEncode = (->
  entities =
    "&": "&amp;"
    "<": "&lt;"
    "\"": "&quot;"
  (value) ->
    value.replace /[&<"]/g, (c) ->
      entities[c]
)()