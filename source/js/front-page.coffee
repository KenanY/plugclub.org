---
---



getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

cobbleLoop = ->
  if db
    false
  else
    db = true
  incrementBy = getRandomInt 1, 128
  curNum = $("#cobble").html()
  curNum = curNum.replace /\,/g, ""
  curNum = parseInt(curNum, 10)
  newNum = curNum + incrementBy
  i = 0
  while i < incrementBy
    $("#cobble").html(addCommas(curNum + 1))
    i++
  db = false

db = false

setInterval(cobbleLoop, 100)