# frozen_string_literal: true

require_relative 'group'

module Wefix
  # Behaviors of the currently logged in account
  class Problem
    attr_reader :id, :description, :latitude, :longitude, # basic info
                :group # full details

    def initialize(info)
      @id             = info['id']
      @description    = info['description']
      @latitude       = info['latitude']
      @longitude      = info['longitude']
      @group          = Group.new(info['group'])
    end
  end
end
