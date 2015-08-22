class User < ActiveRecord::Base

  acts_as_authentic

  has_many :users_chats
  has_many :chats, through: :users_chats
  has_many :messages

  mount_uploader :avatar, AvatarUploader

  default_scope -> { where(active: true) }

  [:admin, :manager, :client].each do |r|
    define_method("#{r}?") { role == "#{r}" }
    scope r, -> { where(role: r.to_s) }
  end

  def full_name
    "#{ first_name }#{ second_name.nil? ? '' : " #{second_name}" }"
  end

  def dedtroy
    active = false
    save
  end

end
