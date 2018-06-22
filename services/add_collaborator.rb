# frozen_string_literal: true

require 'http'

# Returns an message with group information
class AddCollaborator
  # Error for inability of API to create group
  class InvalidCollaborator < StandardError
    def message
      'This Email can not be added'
    end
  end

  def initialize(config)
    @config = config
  end

  # Create group with group_data
  def call(user, grp_id, email:)
    response = HTTP.auth("Bearer #{user.auth_token}")
                   .post("#{@config.API_URL}/groups/#{grp_id}/add_collaborator",
                         json: { email: email })
    raise InvalidCollaborator unless response.code == 200
  end
end
