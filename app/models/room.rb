class Room < ActiveRecord::Base

  has_many :users, through: :users_rooms

end
