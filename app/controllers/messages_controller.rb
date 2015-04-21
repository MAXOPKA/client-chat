class MessagesController < ChatController

  def create
    @message = Message.new params[:message]
    @message.user = current_user
    if @message.save
      broadcast_message :new_message, render_message
    end
  end

  private

  def render_message
    {
     :created_at => @message.created_at.strftime('%H:%M:%S'),
     :message => @message.message,
     :user => @message.user.login,
     :avatar_url => @current_user.avatar.small_thumb.url
    }
  end

end