# frozen_string_literal: true

require "dry-validation"

module Wefix
  module Form
    NewProblem = Dry::Validation.Params do
      LOCATION_REGEX = %r{^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$}

      configure do
        config.messages_file = File.join(__dir__, "errors/new_problem.yml")
      end

      required(:description).filled
      required(:latitude).filled
      required(:longitude).filled
    end
  end
end
