$(document).ready ->
  if q = $.url().param 'q'
    #access with a query
    $('#kw').val q
    location.href = 'http://www.baidu.com/s?wd=' + q

  else
    #access directly, without a query