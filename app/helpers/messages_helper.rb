module MessagesHelper

  def set_message
    @message = Message.find params[:id]
  end

end
