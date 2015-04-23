class ChatController < WebsocketRails::BaseController

  include ApplicationHelper
  include ActionView::Helpers::SanitizeHelper

  before_action do
    Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
  end

  def cookies
    request.cookies
  end

end
