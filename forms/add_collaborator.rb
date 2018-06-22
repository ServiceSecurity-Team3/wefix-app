# frozen_string_literal: true

require 'dry-validation'

module Wefix
  module Form
    AddCollaborator = Dry::Validation.Params do
      required(:email).filled

      configure do
        config.messages_file = File.join(__dir__, 'errors/add_collaborator.yml')
      end
    end
  end
end
