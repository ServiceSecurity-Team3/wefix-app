# frozen_string_literal: true

require 'http'

module Wefix
  # Returns an authenticated user, or nil
  class VerifyRegistration
    class RegistrationVerificationError < StandardError; end

    def initialize(config)
      @config = config
    end

    def call(username:, email:)
      registration_token = SecureMessage.encrypt(username: username, email: email)
      verification_url = "#{@config.APP_URL}/auth/register/#{registration_token}"

      response = HTTP.post("#{@config.API_URL}/auth/register",
                           json: {
                             username: username,
                             email: email,
                             verification_url: verification_url
                           })

      raise(RegistrationVerificationError) unless response.code == 201
      response.parse
    end
  end
end
