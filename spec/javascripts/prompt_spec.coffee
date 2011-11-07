require "/javascripts/prompt.js"

describe "read stdin", ->
  prompt = null
  it "read input", ->
    console.log('prompt')
    spyOn(prompt,'promptForTitle2').andCallThrough()
    expect(prompt.promptForTitle1("1,2")).toEqual [3,4]
    expect(prompt.promptForTitle2).toHaveBeenCalledWith("3,4")
  beforeEach ->
    prompt=new window.Prompt()



