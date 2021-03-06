class UserSessionsController < ApplicationController

  skip_before_filter :require_user, :only => [:new, :create]

  def new
    unless current_user.nil?
      redirect_to(send "#{current_user.role}_root_path")
    else
      @user_session = UserSession.new
    end
  end

  def create
    @user_session = UserSession.create(params[:user_session])
    if @user_session.save
      flash[:notice] = I18n.t "login_successful"
      redirect_to root_path
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = I18n.t "logout successful"
    redirect_to login_path
  end

end
