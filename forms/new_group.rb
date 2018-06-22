# frozen_string_literal: true

require 'dry-validation'

module Wefix
  module Form
    NewGroup = Dry::Validation.Params do
      required(:name).filled
      required(:description).filled

      configure do
        config.messages_file = File.join(__dir__, 'errors/new_group.yml')
      end
    end
  end
end
