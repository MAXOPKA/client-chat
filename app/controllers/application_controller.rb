class ApplicationController < ActionController::Base

  load_and_authorize_resource

  include ApplicationHelper

  helper_method :current_user

  protect_from_forgery with: :exception

  before_action :require_user, :set_locale


end
