module Multicolor
  module REST
    module Endpoints
      module Filepath
        def color_search(options)
          post(:color_search, options)
        end

        def extract_collection_colors(options)
          filepaths = options.delete(:filepaths)
          get(:extract_collection_colors, Multicolor::Util.filepaths(filepaths).merge(options))
        end

        def get_metadata(filepaths)
          get(:get_metadata, Multicolor::Util.filepaths(filepaths))
        end

        def update_metadata(payload)

        end
      end
    end
  end
end
