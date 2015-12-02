class Admin::SettingsController < AdminController
  def index
    @settings = Setting.get_all
  end

  def edit
  end

  def update
  end
end
