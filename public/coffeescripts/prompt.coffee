class Prompt
  constructor: ->
    @pairs=[[0,0],[0,0]]
  promptForTitle1: (str)->
    console.log "input title1 #{str}"
    halves =  str.split(',')
    @pairs[0] = parseFloat num for num in halves
    @promptForTitle2("3,4")
  promptForTitle2: (str)->
    console.log "input title2 #{str}"
    halves =  str.split(',')
    @pairs[1] = parseFloat num for num in halves


#export Prompt
window.Prompt = Prompt
