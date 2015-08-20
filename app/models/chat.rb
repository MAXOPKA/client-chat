class Chat < ActiveRecord::Base

  STATUSES = %w(pending open closed deleted)

  has_many :users_chats
  has_many :users, through: :users_chats
  has_many :messages, dependent: :destroy

  belongs_to :client, class_name: User
  belongs_to :manager, class_name: User


end
