module Multicolor
  module REST
    module Endpoints
      module Indexing
        def add(payload)
          post(:add, Multicolor::Util.payload_builder(payload))
        end

        def delete(filepaths)
          post(:delete, Multicolor::Util.filepaths(filepaths))
        end
      end
    end
  end
end
