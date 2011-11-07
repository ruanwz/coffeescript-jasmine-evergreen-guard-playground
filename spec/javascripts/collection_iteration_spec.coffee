require '/javascripts/collection_iteration.js'

describe "dot notation and bracket notations", ->
  it "both notations work", ->
    #corly brace in coffeescript is only to define object
    #commas and curly braces are optional
    #the magic here is that every time coffeescript copiler sees:, it knows
    #that you are building an object
    #function call like:
    # draw x,y, invert: true
    father = {
      name: 'John'
    }
    mother =
      name: 'May'
      daughter:
        name: 'Jill'
      son:
        name: 'Jack'
    expect(father.name).toEqual father['name']
  it "same name key-value pairs", ->
    delta='lu0394'
    greekUnicode = {delta}
    greekUnicode2={delta: delta}
    expect(greekUnicode).toEqual greekUnicode2
  it "set a to b if b exists, otherwise, set a to c", ->
    c=1
    a = b ? c
    expect(a).toEqual 1
  it "chain as many soaks as you like", ->
    c=1
    b={name: 'tom'}
    a=b?.name ? c
    expect(a).toEqual 'tom'
    #more example: cats?['Garfieldl]?.eat?() if lasagna
describe 'Arrays', ->
  it 'defined using JSON-style syntax', ->
    mcFlys=['G','L','M']
  it 'defined using ranges', ->
    expect([1..5]).toEqual [1,2,3,4,5]
    expect([1...5]).toEqual [1,2,3,4]
    expect([5...1]).toEqual [5,4,3,2]
  it 'slicing', ->
    myarray=['a','b','c','d']
    expect(myarray.slice 0,3).toEqual myarray[0...3]
    expect(myarray.slice 0,2).toEqual myarray[0...-2]
    console.log myarray.slice 2,3
    expect(myarray.slice 2,4).toEqual myarray[-2..]
  it 'splicing', ->
    myarray=['a','c']
    myarray[1...1]=['b']
    expect(myarray).toEqual ['a','b','c']
describe 'iterating over collections', ->
  # 2 built-in syntaxes for iterating over collection
  # 1 for objects and 1 for arrays
  it 'iterating over object', ->
    name='jack'
    sex='male'
    myobj={name,sex}
    # 2nd varialbe(value) is optional
    for key, value of myobj
      console.log key+value
    # use own to not iterate the properties inherited from its prototype
    for own key, value of myobj
      console.log key+value

  it "iterate array", ->
    myarray=[1,2,3]
    for value in myarray
      console.log value
    # why have a separate syntax? because there's nothing stopping an array
    # from having extra methods or data. If you want the whole shebang, then
    # use of. But if you want to treat the array as an array, use in--you 'll
    # only get array[0], array[1], etc., up to array[arrray.length-1]
  it 'iteration can has guard',->
    myarray=[1,2,3]
    for v in myarray when typeof v is 'function'
      v()
  it 'no scope for iteration', ->
    myarray=[1,2,3]
    for v in myarray
      break if v is 2
    expect(v).toEqual 2
  it 'for..in supports modifier: by', ->
describe 'conditional iteration',->
  it 'while, until, loop',->
  it 'break or return to quit loop',->
describe 'comprehension', ->
describe 'pattern matching', ->
    

