module Multicolor
  module REST
    module Endpoints
      module Metadata
        def count_collection_colors(options)
          keys = [:colors, :count_colors, :weights, :filepaths]
          options = modify_options_for_keys(options, keys)
          get(:count_collection_colors, options)
        end

        def count_metadata(options)
          keys = [:colors, :count_metadata, :weights, :filepaths]
          options = modify_options_for_keys(options, keys)
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
