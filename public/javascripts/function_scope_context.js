(function() {
  var Hello;
  Hello = (function() {
    function Hello() {}
    Hello.prototype.say = function(name) {
      console.log("Hello#say");
      return name + ',Hello!';
    };
    Hello.prototype.cube = function(num) {
      return Math.pow(num, 3);
    };
    Hello.prototype.odd = function(num) {
      if (typeof num === 'number') {
        if (num === Math.round(num)) {
          if (num > 0) {
            return num % 2 === 1;
          } else {
            throw "" + num + " is not positive";
          }
        } else {
          throw "" + num + " is not an integer";
        }
      } else {
        throw "" + num + " is not a number";
      }
    };
    Hello.prototype.odd_shorter = function(num) {
      if (typeof num !== 'number') {
        throw "" + num + " is not a number";
      }
      if (Math.round(num) !== num) {
        throw "" + num + " is not an integer";
      }
      if (!(num > 0)) {
        throw "" + num + " is not positive";
      }
    };
    return Hello;
  })();
  window.Hello = Hello;
}).call(this);
