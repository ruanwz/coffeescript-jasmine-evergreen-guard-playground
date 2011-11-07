class Hello
  constructor: ->
  say: (name)->
    console.log "Hello#say" 
    name+',Hello!'
  cube: (num)->
    Math.pow num,3
  odd: (num)->
    if typeof num is 'number'
      if num is Math.round num
        if num > 0
          num % 2 is 1
        else
          throw "#{num} is not positive"
      else
        throw "#{num} is not an integer"
    else
      throw "#{num} is not a number"
  odd_shorter: (num)->
    throw "#{num} is not a number" unless typeof num is 'number'
    throw "#{num} is not an integer" unless Math.round(num) is num
    throw "#{num} is not positive" unless num > 0
#export
window.Hello = Hello
