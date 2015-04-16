module UsersHelper

  def set_user
    @user = User.find(@current_user.id) if !@current_user.nil?
  end

end
