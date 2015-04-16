class Message < ActiveRecord::Base
  belongs_to :user, :room
end
