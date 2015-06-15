class CreateUsersRooms < ActiveRecord::Migration
  def self.up
    create_table :users_rooms do |t|
      t.belongs_to :user
      t.belongs_to :room
    end
  end

  def self.down
    drop_table :users_rooms
  end
end
