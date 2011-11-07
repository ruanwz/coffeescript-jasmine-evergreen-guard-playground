require "/javascripts/function_scope_context.js"
describe "function", ->
  hello = null
  beforeEach ->
    hello = new window.Hello
  describe "function can accept argument and return value", ->
    it "say hello", ->
      expect(hello.say("david")).toEqual('david,Hello!')
    it "caculate", ->
      expect(hello.cube(2)).toEqual 8
    it "odd", ->
      expect(hello.odd(4)).toBeFalsy()
      expect(hello.odd(3)).toBeTruthy()
  describe "function can throw exception", ->
    it "throw", ->
      expect(-> hello.odd(3.2)).toThrow("3.2 is not an integer")
      expect(-> hello.odd(-3)).toThrow("-3 is not positive")
      expect(-> hello.odd(-3.2)).toThrow("-3.2 is not an integer")
      expect(-> hello.odd("abc")).toThrow("abc is not a number")
      expect(-> hello.odd_shorter(3.2)).toThrow("3.2 is not an integer")
      expect(-> hello.odd_shorter(-3)).toThrow("-3 is not positive")
      expect(-> hello.odd_shorter(-3.2)).toThrow("-3.2 is not an integer")
      expect(-> hello.odd_shorter("abc")).toThrow("abc is not a number")
describe "scope is where you see", ->
  it "variable in inner scope", ->
    change_g = -> g=3
    g = 1
    change_g()
    expect(g).toEqual 1

  it "shadowing variable using argument", ->
    g = 1
    change_g = (g)-> g=3
    change_g()
    expect(g).toEqual 1
describe "context is all about self", ->
  setName = (name)-> @name=name
  it "2 different name", ->
    setName("david")
    expect(name).toEqual "david"

  describe "context's purpose is to give an object's method a way of referring to the object ther're being called on", ->
    it "attach method of object, then call method on object", ->
      cat = {}
      cat.setName=setName
      cat.setName("miao")
      expect(cat.name).toEqual "miao"
    it "invoke function in a particular context without attaching the function to that object", ->
      pig = {}
      setName.apply(pig,["wo"])
      expect(pig.name).toEqual "wo"

      horse = {}
      setName.call(horse,"ho")
      expect(horse.name).toEqual "ho"

    it "new can give a function a context", ->
      Dog = setName
      dog1 = new Dog("dod")
      expect(dog1.name).toEqual "dod"
      #console.log "new keyword says: don't return the result of the function; instead, create a new object, run the function in that object's context, and then return the object"
      #console.log "context is determined purely by how a function is called; unlike scope, it has nothing to do wiht where the function is defined
  describe "=> use to bind the function to current context", ->
    it "=> use in callback", ->
      cat = {
        status: "bad"
        eat: => @status = 'good'
        display: -> console.log @status
        }
      dog = {}
      dog.eat=cat.eat
      dog.eat()
      cat.display()
      console.log "self is the upper scope:"+@status
      expect(@status).toEqual 'good'
      class Cat 
        constructor: (@status)->
        eat: => @status = 'good'
      mycat = new Cat('bad')
      expect(mycat.status).toEqual 'bad'
      dog.eat=mycat.eat
      dog.eat()
      console.log "mycat.status"+mycat.status
      expect(mycat.status).toEqual 'good'
 
 describe "a?=b and a||=b", ->
   it "a is boolean false",->
     a = 0
     a ||= 3
     expect(a).toEqual(3)
   it "a doesn't exist", ->
     a?=3
     expect(a).toEqual(3)
 describe "default argument", ->
   it "internally use existential operator", ->
     ring = (isDrill)->
       true unless isDrill?
     expect(ring()).toEqual(true)
     expect(ring(isDrill=true)).toEqual(null)
     expect(ring(123)).toEqual(null)
   it "another form of using default argument", ->
     ring = (isDrill=true)->
       isDrill
     expect(ring()).toEqual(true)
     expect(ring(isDrill=true)).toEqual(true)
     expect(ring(true)).toEqual(true)
describe "splats", ->
  it "can accept more arguments",->
    refine=(wheat,chaff...)->
      console.log "the first #{wheat}"
      console.log "the rest #{chaff.join(',')}"
    refine "great","not bad","so-so","meh"
