# frozen_string_literal: true

require_relative 'group'

module Wefix
  # Behaviors of the currently logged in account
  class Groups
    attr_reader :all

    def initialize(groups_list)
      @all = groups_list.map do |grp|
        Group.new(grp)
      end
    end
  end
end
