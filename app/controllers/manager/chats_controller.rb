class Manager::ChatsController < ApplicationController

  def index
    @chats = current_user.chats
  end

end
