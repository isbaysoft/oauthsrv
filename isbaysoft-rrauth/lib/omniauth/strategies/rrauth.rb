require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Rrauth < OmniAuth::Strategies::OAuth2

      DEFAULT_SCOPE = 'user'
      
      option :fields, [:email]
      option :uid_field, :email

      option :client_options, {
        site: 'http://localhost:3001',
        authorize_url: '/oauth/authorize',
        token_url: '/oauth/token'
      }

      option :token_params, {
        parse: :json,
        expires: 1
      }

      option :access_token_options, {
        header_format: 'OAuth %s',
        param_name: 'access_token'
      }

      uid { raw_info['id'] }

      info do
        {
          email: raw_info['email']
        }
      end

      extra do
        {raw_info: raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get("/api/current_user").parsed || {}
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
     
    end
	end
end