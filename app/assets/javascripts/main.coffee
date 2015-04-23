class @ChatApp

  messageTemplate: (message) ->
    """
    <div>
      <span>
        <label class='label'>#{message.created_at}
         написал
         <img src="#{message.avatar_url}" /> #{message.user}
        </label>
        <br/>
        #{message.message}
      </span>
    </div>
    """

  constructor: () ->
    @dispatcher = new WebSocketRails($("#chat").attr("data-uri"))
    @bindEvents()
    @bindHandlers()

  bindEvents: ->
    @dispatcher.on_open = @lastMessages
    @dispatcher.bind 'last_messages', @renderMessages
    @dispatcher.bind 'new_message', @receiveMessage
    $('#send_message').click @sendMessage

  bindHandlers: ->
    $("#chat").scroll (el)->
      if $("#chat").scrollTop() == 0
        window.chatApp.lastMessages()

  receiveMessage: (data) =>
    $('#chat').append @messageTemplate(data)
    window.chatApp.scrollToDown($("#chat"), 0)

  renderMessages: (messages) =>
    if messages.length > 0
      $(messages).each (i,m)->
        $('#chat').prepend window.chatApp.messageTemplate(m)

  lastMessages: (e) =>
    @dispatcher.trigger 'last_messages', offset: $("#chat>div").length

  sendMessage: (e) =>
    e.preventDefault()
    message_text = $('#message').val()
    @dispatcher.trigger 'new_message', message: message_text
    $('#message').val('')

  scrollToDown: (el, speed) =>
    $(el).animate({ scrollTop: $(el)[0].scrollHeight}, speed);

  scrollToTop: (el, speed) =>
    $(el).animate({ scrollTop: 1}, speed);

$(document).ready ->
  window.chatApp = new ChatApp