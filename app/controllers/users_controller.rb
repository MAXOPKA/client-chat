class UsersController < ApplicationController

  skip_before_filter :require_user, :only => [:new, :create]

  before_action :set_user, :only => [:update, :edit, :show, :destroy]

  def index

  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to account_path
    else
      redirect_to new_user_path
    end
  end

  def edit

  end

  def update
    @user.avatar = params[:avatar]
    @user.remove_avatar! if params[:remove_avatar]
    if @user.update(user_params)
      redirect_to account_path
    else
      render :edit
    end
  end

  def destroy
    @user.delete
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :avatar, :remove_avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
