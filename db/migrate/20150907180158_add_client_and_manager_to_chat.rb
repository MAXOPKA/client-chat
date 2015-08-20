class AddClientAndManagerToChat < ActiveRecord::Migration
  def self.up
    add_reference :chats, :client
    add_reference :chats, :manager
  end

  def self.down
    remove_reference :chats, :client
    remove_reference :chats, :manager
  end
end
