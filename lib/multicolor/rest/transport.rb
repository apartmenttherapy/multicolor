require 'multicolor/rest/endpoints/filepath'
require 'multicolor/rest/endpoints/indexing'
require 'multicolor/rest/endpoints/metadata'

module Multicolor
  module REST
    class Transport
      include Multicolor::REST::Endpoints::Filepath
      include Multicolor::REST::Endpoints::Indexing
      include Multicolor::REST::Endpoints::Metadata

      attr_reader :client, :config

      delegate :company, to: :config

      def initialize(config)
        @config = config

        @client = Faraday.new(url: url) do |conn|
          conn.request  :multipart
          conn.request  :url_encoded
          conn.response :json
          conn.adapter  :net_http

          conn.use Faraday::Response::RaiseError

          conn.options[:timeout]      = config.timeout
          conn.options[:open_timeout] = config.open_timeout

          conn.basic_auth(config.username, config.password) if config.authenticate?
        end
      end

      private

      def get(endpoint, params = {}, &block)
        client.get(api_path(endpoint), params, &block)
      end

      def post(endpoint, params = {}, &block)
        client.post(api_path(endpoint), params, &block)
      end

      def url
        "http://multicolorengine.tineye.com"
      end

      def api_path(endpoint)
        raise Multicolor::Errors::CompanyNotSet if company.nil?
        "#{company}/rest/#{endpoint}"
      end
    end
  end
end
