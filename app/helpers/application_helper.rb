module ApplicationHelper

  def require_user
    unless current_user
      flash[:notice] = I18n.t "registration_error"
      redirect_to login_path
      return false
    end
  end

  def set_locale
    I18n.locale = 'ru'
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end