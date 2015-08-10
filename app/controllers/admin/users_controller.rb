class Admin::UsersController < ApplicationController

  before_action :set_user, only: [:new, :edit, :update, :destroy]

  def index
    @users = User.managers.page(params[:page].to_i).per(10)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :login, :password, :password_confirmation)
  end

end
