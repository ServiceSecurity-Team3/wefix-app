# frozen_string_literal: true

require 'roda'

module Wefix
  # Web controller for Wefix API
  class App < Roda
    route('account') do |routing|
      routing.on do
        # GET /auth/login
        routing.get String do |username|
          if @current_account && @current_account['username'] == username
            view :account, locals: { current_account: @current_account }
          else
            routing.redirect '/auth/login'
          end
        end
      end
    end
  end
end
