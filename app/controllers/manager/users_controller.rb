class Manager::UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.client
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.update_attribute(:role, 'client')
    redirect_to manager_users_path
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to manager_users_path
  end

  def destroy
    @user.delete
    render nothing: true
  end

  private

  def set_user
    @user = User.find(params[:user])
  end

  def user_params
    params.require(:user).permit( :first_name, :second_name, :login, :password, :avatar, :description, :company )
  end

end
