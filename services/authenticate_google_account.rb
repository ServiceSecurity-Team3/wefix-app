# frozen_string_literal: true

require "http"

module Wefix
  # Returns an authenticated user, or nil
  class AuthenticateGoogleAccount
    def initialize(config)
      @config = config
    end

    def call(access_token)
      get_sso_account_from_api(access_token)
    end

    private

    def get_sso_account_from_api(access_token)
      sso_info = {access_token: access_token}
      signed_sso_info = SecureMessage.sign(sso_info)
      response =
        HTTP.post("#{@config.API_URL}/auth/authenticate/gsso_account",
                  json: signed_sso_info)
      response.code == 200 ? response.parse : nil
    end
  end
end
