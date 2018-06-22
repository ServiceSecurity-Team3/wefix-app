# frozen_string_literal: true

require 'http'

# Returns all groups belonging to an account
class GetAllGroups
  def initialize(config)
    @config = config
  end

  def call(user)
    response = HTTP.auth("Bearer #{user.auth_token}")
                   .get("#{@config.API_URL}/groups")
    response.code == 200 ? response.parse : nil
  end
end
