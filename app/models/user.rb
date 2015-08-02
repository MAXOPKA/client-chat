class User < ActiveRecord::Base

  acts_as_authentic do
  end

  has_many :users_chats
  has_many :chats, through: :users_chats
  has_many :messages

  mount_uploader :avatar, AvatarUploader

end
