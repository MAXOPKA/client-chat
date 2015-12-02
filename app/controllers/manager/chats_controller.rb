class Manager::ChatsController < ManagerController

  def index
    @chats = current_user.chats
  end

end
