# frozen_string_literal: true

require 'http'

# Returns all groups belonging to an account
class GetGroup
  def initialize(config)
    @config = config
  end

  def call(user, grp_id)
    response = HTTP.auth("Bearer #{user.auth_token}")
                   .get("#{@config.API_URL}/groups/#{grp_id}")
    response.code == 200 ? response.parse : nil
  end
end