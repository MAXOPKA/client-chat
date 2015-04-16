class Room < ActiveRecord::Base
  has_many :users, :trough => :users_rooms
end
