(function() {
  var addCommas, cobbleLoop, formatNumber, getRandomInt;

  addCommas = function(nStr) {
    var rgx, x, x1, x2;
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = '';
    if (x.length > 1) {
      x2 = '.' + x[1];
    }
    rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
  };

  formatNumber = function(num) {
    return addCommas(num.toFixed(0));
  };

  getRandomInt = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  };

  cobbleLoop = function() {
    var curNum, i, incrementBy, newNum, _results;
    incrementBy = getRandomInt(1, 128);
    curNum = $("#cobble").html();
    curNum = curNum.replace(/\,/g, "");
    curNum = parseInt(curNum, 10);
    newNum = curNum + incrementBy;
    i = 0;
    _results = [];
    while (i < incrementBy) {
      $("#cobble").html(formatNumber(curNum + 1));
      _results.push(i++);
    }
    return _results;
  };

  setInterval(cobbleLoop, 100);

}).call(this);
