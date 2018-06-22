# frozen_string_literal: true

require 'http'

# Returns an message with group information
class CreateProblem
  # Error for inability of API to create group
  class InvalidProblem < StandardError
    def message
      'This Problem can no longer be created: please start again'
    end
  end

  def initialize(config)
    @config = config
  end

  # Create group with group_data
  def call(user, grp_id, description:, latitude:, longitude:)
    response = HTTP.auth("Bearer #{user.auth_token}")
                   .post("#{@config.API_URL}/groups/#{grp_id}/problems",
                         json: {
                           description: description,
                           latitude: latitude,
                           longitude: longitude
                         })
    raise InvalidProblem unless response.code == 201
  end
end
