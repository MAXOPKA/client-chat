module UsersHelper

  def set_user
    @user = User.find(@current_user.id) if params[:id] && !@current_user.nil?
  end

end
