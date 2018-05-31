# frozen_string_literal: true

require_relative 'group'

module Wefix
  # Behaviors of the currently logged in account
  class Group
    attr_reader :id, :name

    def initialize(grp_info)
      @id = grp_info['id']
      @name = grp_info['name']
    end
  end
end
