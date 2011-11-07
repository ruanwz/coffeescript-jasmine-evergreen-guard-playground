(function() {
  var Prompt;
  Prompt = (function() {
    function Prompt() {
      this.pairs = [[0, 0], [0, 0]];
    }
    Prompt.prototype.promptForTitle1 = function(str) {
      var halves, num, _i, _len;
      console.log("input title1 " + str);
      halves = str.split(',');
      for (_i = 0, _len = halves.length; _i < _len; _i++) {
        num = halves[_i];
        this.pairs[0] = parseFloat(num);
      }
      return this.promptForTitle2("3,4");
    };
    Prompt.prototype.promptForTitle2 = function(str) {
      var halves, num, _i, _len, _results;
      console.log("input title2 " + str);
      halves = str.split(',');
      _results = [];
      for (_i = 0, _len = halves.length; _i < _len; _i++) {
        num = halves[_i];
        _results.push(this.pairs[1] = parseFloat(num));
      }
      return _results;
    };
    return Prompt;
  })();
  window.Prompt = Prompt;
}).call(this);
