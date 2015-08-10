class User < ActiveRecord::Base

  acts_as_authentic

  scope :managers, -> { where(role: 'manager') }

  has_many :users_chats
  has_many :chats, through: :users_chats
  has_many :messages

  mount_uploader :avatar, AvatarUploader

  [:admin, :manager, :client].each do |r|
    define_method("#{r}?") { role == "#{r}" }
  end

  def full_name
    "#{ first_name }#{ second_name.nil? ? '' : " #{second_name}" }"
  end

end
