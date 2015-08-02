class CreateUsersChats < ActiveRecord::Migration
  def self.up
    create_table :users_chats do |t|
      t.belongs_to :user
      t.belongs_to :chat
    end
  end

  def self.down
    drop_table :users_chats
  end
end
