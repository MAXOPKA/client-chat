class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.belongs_to :chat
      t.belongs_to :user
      t.text :message
      t.string :attach
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :messages
  end
end
