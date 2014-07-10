require 'multicolor/rest/transport'

module Multicolor
  module REST
    class Client
      delegate :get_search_metadata, :get_return_metadata,
        :count, :list, :ping, :add, :delete, :get_metadata,
        :update_metadata, :color_search,
        :extract_collection_colors, to: :transport

      def initialize(options = {})
        yield(self) if block_given?
      end

      def config
        @configuration ||= Multicolor::Configuration.new
      end

      private

      def transport
        @transport ||= Multicolor::REST::Transport.new(config)
      end
    end
  end
end
