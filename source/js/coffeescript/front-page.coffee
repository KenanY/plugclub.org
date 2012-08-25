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
  Math.floor(Math.random() * (max - min + 1)) + min

cobbleLoop = ->
  incrementBy = getRandomInt 1, 128
  curNum = $('#cobble').html()
  curNum = curNum.replace /\,/g, ''
  curNum = parseInt(curNum, 10)
  newNum = curNum + incrementBy
  $('#cobble').html(formatNumber(newNum))



$(document).ready(->
  month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  $.ajax
    url: "https://api.github.com/repos/KenanY/plugclub.org/commits",
    dataType: 'jsonp',
    success: (json) ->
      latest = json.data[0]
      $('a.commit').html "#{ latest.sha.substring(0, 7) }"
      $('a.commit').attr 'href', "https://github.com/KenanY/plugclub.org/commit/#{ latest.sha }"

  setInterval(cobbleLoop, 3000)
)