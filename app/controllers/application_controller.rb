class ApplicationController < ActionController::Base

  include ApplicationHelper

  helper_method :current_user

  protect_from_forgery with: :exception

  before_action :require_user, :set_locale


end
