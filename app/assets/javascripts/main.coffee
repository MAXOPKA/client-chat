class @ChatApp

  messageTemplate: (message, channelName = 'broadcast') ->
    """
    <div>
      <span>
        <label class='label label-#{if channelName == 'broadcast' then 'warning' else 'info'}'>
          [#{channelName}]
        </label> #{message}
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


  receiveGlobalMessage: (message) =>
    alert('qweqw')
    $('#chat_history').append @messageTemplate(message.text)

  receiveMessage: (message) =>
    alert "sad"
    $('#chat_history').append @messageTemplate(message.text, @currentChannel.name)

  sendMessage: (e) =>
    e.preventDefault()
    message = $('#message').val()
    @dispatcher.trigger 'new_message', text: message
    #$('#message').val('')

$(document).ready ->
  window.chatApp = new ChatApp