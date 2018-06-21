# frozen_string_literal: true

require "roda"
require "slim"
require "slim/include"

module Wefix
  # Base class for Wefix Web Application
  class App < Roda
    plugin :render, engine: "slim", views: "views"
    plugin :assets, css: ["bootstrap.css", "base.css", "vendor.css", "main.css", "style.css"],
                    js: ["modernizr.js", "pace.min.js"],
                    path: "assets"

    plugin :public, root: "public"
    plugin :multi_route
    plugin :flash

    route do |routing|
      @current_user = Session.new(SecureSession.new(session)).wget_user
      @google_token = App.config.GOOGLE_CLIENT_ID

      routing.public
      routing.assets
      routing.multi_route

      # GET /
      routing.root do
        @smoothscroll = true
        view "home", locals: {
                       current_user: @current_user,
                       google_token: @google_token,
                       smoothscroll: @smoothscroll,
                     }
      end
    end
  end
end
