class ChatsController < ApplicationController

  include ChatsHelper

  before_action :set_chat, only: [:destroy, :update, :edit, :show]

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if Chat.create
      redirect_to chats_path
    else
      render :new
    end
  end

  def show

  end

  def index
    @chats = Chat.all
  end

  def edit

  end

  def update
    if @chat.update(chat_params)
      redirect_to chats_path
    else
      render :edit
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:name, :locked)
  end

end
