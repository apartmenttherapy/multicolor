module Multicolor
  module REST
    module Endpoints
      module Metadata
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
