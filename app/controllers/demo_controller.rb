class DemoController < ApplicationController

  skip_load_and_authorize_resource
  skip_before_action :require_user
  
  def index
  end

  def login
  end
end
