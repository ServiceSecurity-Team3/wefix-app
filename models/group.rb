# frozen_string_literal: true

require_relative 'problem'
require_relative 'user'
require 'ostruct'

module Wefix
  # Behaviors of the currently logged in account
  class Project
    attr_reader :id, :name, # basic info
                :owner, :collaborators, :problem, :policies # full details

    def initialize(info)
      @id = info['id']
      @name = info['name']
      @owner = User.new(info['owner'])
      @collaborators = process_collaborators(info['collaborators'])
      @problems = process_problems(info['problems'])
      @policies = OpenStruct.new(info['policies'])
    end

    private

    def process_problems(problems_info)
      return nil unless problems_info
      problems_info.map { |prob_info| Problem.new(prob_info) }
    end

    def process_collaborators(collaborators_info)
      return nil unless collaborators_info
      collaborators_info.map { |account_info| User.new(account_info) }
    end
  end
end
