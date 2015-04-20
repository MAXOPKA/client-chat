class Room < ActiveRecord::Base

  has_many :users, through: :users_rooms
  has_many :messages, dependent: :destroy

end
