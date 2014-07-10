module Multicolor
  module Util
    class << self
      def param_builder(params)
        new_params = {}
        new_params.merge!(filepaths(params[:filepaths]))
        new_params
      end

      def filepaths(filename)
        Array.wrap(filename).inject({}) do |data, item|
          data["filepaths[#{data.keys.count}]"] = item
          data
        end
      end

      def build_colors(params)
        payload_builder(flatten_colors(params))
      end

      def flatten_colors(params)
        params.is_a?(Hash) ? params.values : params
      end

      def payload_builder(payload)
        processed = 0
        data = {}
        (payload || {}).each do |entry|
          entry.keys.each do |key|
            value = entry[key]
            data["#{key.to_s.pluralize}[#{processed}]"] = value.is_a?(Hash) ? value.to_json : value
          end
          processed += 1
        end
        data
      end
    end
  end
end
