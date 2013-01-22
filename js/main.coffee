autoTime = 233 #此为每个字符的打印时间

#鼠标移动到Button
moveToButton = ->
  $('#fake_mouse').animate(
    top: $('#su').position().top + 5,
    left: $('#su').position().left+15,
    500, ->
      #这里添加发送请求 记得模拟下鼠标点击效果啊!
      location.href = $('#search').attr('action') + '?' + $('#search').formSerialize()
  )

#鼠标移动到Test
moveToText = ->
  $('#fake_mouse').animate(
    top: $("#kw").position().top + 5,
    left: $("#kw").position().left,
    2000, ->
      $("#kw").focus()
  )
#鼠标乱动触发下事件
moveToRandom = (str)->
  stemp = str
  $('#fake_mouse').animate(
    top:"+=5px",
    left:"+=10px",
    "fast", ->
      autoInput(stemp,0)
  )

#选择鼠标图片
switchMouseCursor = ->
  agent = navigator.userAgent
  if agent.indexOf("Windows NT")
    $('#fake_mouse').attr("src", "img/mouse_arrow_windows_aero.png")
  else if agent.indexOf("Mac OS")
    $('#fake_mouse').attr("src", "img/mouse_arrow_mac.png")


autoInput = (str,index) ->
  val = str.substr(0,index + 1)
  $("#kw").attr("value",val)
  if index < str.length
    setTimeout(
      -> autoInput(str,index+1),
      Math.random()*autoTime
    )
  else
    moveToButton()

$(document).ready ->
  if wd = $.url().param 'wd'
    #access with a query
    $('#fake_mouse').show()
    switchMouseCursor()
    $('#su').ready ->
      moveToText()
      moveToRandom(wd)

  else
    #access directly, without a query
    $('#search').submit ->
      @kw.value = _.string.trim(@kw.value)
      if @kw.value
        $("#seachUrl").val 'http://bangnibaidu.com/' + '?' + $('#search').formSerialize()
      false