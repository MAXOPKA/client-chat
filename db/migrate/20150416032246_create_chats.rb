class CreateChats < ActiveRecord::Migration
  def self.up
    create_table :chats do |t|
      t.string :status, default: 'pending'
      t.timestamps null: false
    end
  end

  def self.down 
    drop_table :chats
  end
end
