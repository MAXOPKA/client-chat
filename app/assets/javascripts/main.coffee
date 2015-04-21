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
  joinTemplate: (channelName) ->
    """
    <div>
      <span>
        <label class='label label-'>
          [Joined Channel]
        </label> #{channelName}
      </span>
    </div>
    """

  constructor: () ->
    @dispatcher = new WebSocketRails($("#chat").attr("data-uri"))
    @bindEvents()

  bindEvents: ->
    @dispatcher.bind 'new_message', @receiveMessage
    $('#send_message').click @sendMessage

  receiveMessage: (data) =>
    $('#chat').append @messageTemplate(data)

  sendMessage: (e) =>
    e.preventDefault()
    message = $('#message').val()
    @dispatcher.trigger 'new_message', text: message
    $('#message').val('')

$(document).ready ->
  window.chatApp = new ChatApp