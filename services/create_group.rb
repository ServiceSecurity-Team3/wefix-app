# frozen_string_literal: true

require 'http'

# Returns an message with group information
class CreateGroup
  # Error for inability of API to create group
  class InvalidGroup < StandardError
    def message
      'This group can no longer be created: please start again'
    end
  end

  def initialize(config)
    @config = config
  end

  # Create group with group_data
  def call(user, name:, description:)
    response = HTTP.auth("Bearer #{user.auth_token}")
                   .post("#{@config.API_URL}/groups/",
            json: {
              name: name,
              description: description
            })
    raise InvalidGroup unless response.code == 201
  end
end
