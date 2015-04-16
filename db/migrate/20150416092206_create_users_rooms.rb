class CreateUsersRooms < ActiveRecord::Migration
  def change
    create_table :users_rooms do |t|
      t.belongs_to :user
      t.belongs_to :room
    end
  end
end
