# frozen_string_literal: true

require 'http'

# Returns all problems belonging to an account
class GetProblem
  def initialize(config)
    @config = config
  end

  def call(user, prb_id)
    response = HTTP.auth("Bearer #{user.auth_token}")
                   .get("#{@config.API_URL}/problems/#{prb_id}")
    response.code == 200 ? response.parse : nil
  end
end