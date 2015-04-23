class MessagesController < ChatController

  MESSAGES_LIMIT = 10

  def create
    @message = Message.new(data)
    @message.user = current_user
    if @message.save
      broadcast_message :new_message, render_message(@message)
    end
  end

  def index
    @messages = Message.includes(:user).order(created_at: :desc).limit(MESSAGES_LIMIT).offset(data[:offset])
    send_message :last_messages, render_messages
  end

  private

  def render_message(message)
    {
     :created_at => message.created_at.strftime('%H:%M:%S'),
     :message => message.message.to_s,
     :user => message.user.login,
     :avatar_url => message.user.avatar.small_thumb.url
    }
  end

  def render_messages
    rendered_messages = Array.new
    @messages.each do |m|
      rendered_messages << render_message(m)
    end
    rendered_messages
  end

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end