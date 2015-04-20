class AuthorizationController < WebsocketRails::BaseController
  def authorize_channels
    channel = WebsocketRails[message[:channel]]
    if can
      accept_channel current_user
    else
      deny_channel({:message => 'authorization failed!'})
    end
  end
end