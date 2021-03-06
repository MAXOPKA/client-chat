class Admin::UsersController < AdminController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.manager.page(params[:page].to_i).per(10)
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      @user.update_attribute :role, 'manager'
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :login, :password, :password_confirmation)
  end

end
