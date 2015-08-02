module ChatsHelper

  def set_chat
    @chat = Chat.find params[:id]
  end

end
