# frozen_string_literal: true

require 'roda'

module Wefix
  # Web controller for Wefix
  class App < Roda
    route('groups') do |routing|
      routing.on do
        # GET /groups/
        routing.get do
          if @current_user.logged_in?
            group_list = GetAllGroups.new(App.config).call(@current_user)

            groups = Groups.new(group_list)

            view :groups_all,
                 locals: { current_user: @current_user, groups: groups }
          else
            routing.redirect '/auth/login'
          end
        end
      end
    end
  end
end
