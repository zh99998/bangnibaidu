// Generated by CoffeeScript 1.4.0
(function() {

  $(document).ready(function() {
    var q;
    if (q = $.url().param('q')) {
      $('#kw').val(q);
      return location.href = 'http://www.baidu.com/s?wd=' + q;
    } else {

    }
  });

}).call(this);