module Multicolor
  module REST
    module Endpoints
      module Metadata
        # {
        #   count_colors: ["122,233,433", "343,433,333"]
        #   filepaths: ["/one/image", "/another/image"]
        #   metadata: {
        #     ...
        #   }
        # }
        def count_collection_colors(options)
          colors = options.delete(:colors)
          payload = Multicolor::Util.payload_builder(colors)
          keys = [:count_colors, :weights, :filepaths]
          options = Multicolor::Util::modify_options_for_keys(options, keys)
          get(:count_collection_colors, options.merge(payload))
        end

        def count_metadata(options)
          colors = options.delete(:colors)
          payload = Multicolor::Util.payload_builder(colors)
          keys = [:colors, :count_metadata, :weights, :filepaths]
          options = Multicolor::Util::modify_options_for_keys(options, keys)
          get(:count_metadata, options)
        end

        def get_search_metadata
          get(:get_search_metadata)
        end

        def get_return_metadata
          get(:get_return_metadata)
        end

        def count
          get(:count)
        end

        def list(options = {})
          get(:list, options)
        end

        def ping
          get(:ping)
        end
      end
    end
  end
end
