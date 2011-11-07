require "/javascripts/myclass.js"

describe "mytest", ->
  template('myclass.html')
  it "test dom", ->
    $('#test').append('<h1 id="added">New</h1>')
    expect($('#test h1#added').length).toEqual(1)
  it "do nothing", ->
    expect(1).toEqual(1)
  it "still do nothing", ->
    p=window.p
    expect(p).toEqual(1)
