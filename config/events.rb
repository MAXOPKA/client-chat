WebsocketRails::EventMap.describe do
  subscribe :new_message, :to => MessagesController, :with_method => :create
end
