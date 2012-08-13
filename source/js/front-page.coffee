---
---



get_random_int = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

throttle = (fn, delay) ->
  timer = null
  () ->
    context = this
    args = arguments
    clearTimeout(timer);
    timer = setTimeout(() ->
      fn.apply(context, args);
    , delay);

cobble_loop = ->
  throttle((event) ->
    toAdd = get_random_int(1, 64)
    while toAdd-= 1
      val += 1
      $('li#cobble').html(addCommas(val) + ' cobblestone mined in Minecraft')
      cobble_loop()
  , 1000)

val = 64

cobble_loop()