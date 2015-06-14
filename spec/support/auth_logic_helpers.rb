module Authlogic
  module TestHelper
    def create_user_session(user)
      post login_path, login: user.login, password: user.password
    end
  end
end

RSpec.configure do |config|
  config.include Authlogic::TestHelper, type: :request
  config.include Authlogic::TestHelper, type: :feature
end