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
          keys = [:count_colors, :weights, :filepaths]
          formatted_options = extract_and_format_options(options, keys)
          get(:count_collection_colors, formatted_options)
        end

        def count_metadata(options)
          keys = [:colors, :count_metadata, :weights, :filepaths]
          formatted_options = extract_and_format_options(options, keys)
          get(:count_metadata, formatted_options)
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

        private

        def extract_and_format_options(options, keys)
          payload = Multicolor::Util.payload_builder(options.delete(:colors))
          options = Multicolor::Util::modify_options_for_keys(options, keys)
          options.merge(payload)
        end
      end
    end
  end
end
