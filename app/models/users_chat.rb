class UsersChat < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  belongs_to :chat, dependent: :destroy

end
