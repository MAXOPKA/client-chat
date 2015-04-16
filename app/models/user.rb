class User < ActiveRecord::Base

  acts_as_authentic do
  end

  has_many :rooms, through: :users_rooms

  mount_uploader :avatar, AvatarUploader

end
