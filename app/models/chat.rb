class Chat < ActiveRecord::Base

  STATUSES = %w(pending open closed deleted)

  has_many :users_chats
  has_many :users, through: :users_chats
  has_many :messages, dependent: :destroy

  mount_uploader :avatar, AttachUploader

end
