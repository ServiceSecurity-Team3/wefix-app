# frozen_string_literal: true

require 'roda'

module Wefix
  # Web controller for Wefix API
  class App < Roda
    route('groups') do |routing|
      routing.on do
        routing.is do
          # GET /groups/
          routing.get do
            if @current_user.logged_in?
              group_list = GetAllGroups.new(App.config).call(@current_user)
              groups = Groups.new(group_list)

              view :groups_all, locals: { 
                   current_user: @current_user, groups: groups 
                  }

            else
              routing.redirect '/auth/login'
            end
          end
        end

        # GET /groups/[grp_id]
        routing.get(String) do |grp_id|
          if @current_user.logged_in?
            grp_info = GetGroup.new(App.config).call(@current_user, grp_id)
            group = Group.new(grp_info)

            view :group, locals: {
              current_user: @current_user, group: group
            }
          end
        end
      end
    end
  end
end