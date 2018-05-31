# frozen_string_literal: true

require 'roda'
require 'slim'

module Wefix
  # Base class for Wefix Web Application
  class App < Roda
    plugin :render, engine: 'slim', views: 'views'
    plugin :assets, css: ['style.css', 'navbar.css', 'social_media.css'] , path: 'assets'
    plugin :public, root: 'public'
    plugin :multi_route
    plugin :flash

    ONE_MONTH = 30 * 24 * 60 * 60

    route do |routing|
      routing.assets
    end

    use Rack::Session::Cookie,
        expire_after: ONE_MONTH,
        secret: config.SESSION_SECRET

    route do |routing|
      @current_user = Session.new(SecureSession.new(session)).get_user

      routing.public
      routing.assets
      routing.multi_route

      # GET /
      routing.root do
        view 'home', locals: { current_user: @current_user }
      end
    end
  end
end
