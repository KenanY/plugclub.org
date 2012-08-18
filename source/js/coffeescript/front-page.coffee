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
  curNum = $("#cobble").html()
  curNum = curNum.replace /\,/g, ""
  curNum = parseInt(curNum, 10)
  newNum = curNum + incrementBy
  i = 0
  while i < incrementBy
    $("#cobble").html(formatNumber(curNum + 1))
    i++

$(document).ready(->
  month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  $.ajax
    url: "https://api.github.com/repos/KenanY/plugclub.org/commits",
    dataType: 'jsonp',
    success: (json) ->
      latest = json.data[0]
      stamp = new Date(latest.commit.committer.date)
      stampString = month[stamp.getMonth()] + ' ' + stamp.getDate() + ', ' + stamp.getFullYear()
      $('#github .description').text(latest.commit.message)
      $('#github .date').text(stampString)
      $('#github .commit').html('Commit ' + latest.sha + ' &raquo;')
      $('#github .commit').attr('href', "https://github.com/KenanY/plugclub.org/commit/" + latest.sha)
  $.ajax
    dataType: 'jsonp',
    url: 'https://api.github.com/repos/KenanY/plugclub.org?callback=plugclubGithub',
    success: (response) ->
      watchers = (Math.round((response.data.watchers / 100), 10) / 10).toFixed(1)
      $('.watchers').html(watchers + 'k<small></small>');

  setInterval(cobbleLoop, 100)
)