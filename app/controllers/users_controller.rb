class UsersController < ApplicationController

  include UsersHelper

  skip_before_filter :require_user, :only => [:new, :create]

  before_action :set_user, :only => [:update, :edit]

  def index

  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to account_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to account_path
    else
      render :edit
    end
  end

  def destroy

  end

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end

end
