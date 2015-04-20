class MessagesController < ChatController

  def create
    @message = Message.new params[:message]
    @message.user = current_user
    if @message.save
      broadcast_message :message, @message
    end
  end

end