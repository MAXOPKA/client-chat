class DemoController < ApplicationController

  skip_load_and_authorize_resource
  skip_before_action :require_user
  
  def index
  end

  def login
  end

  def manager_profile
  end

  def client_profile
  end

  def clients
  end

  def managers
  end

  def chats
  end

  def chat
  end
end
