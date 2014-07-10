module Multicolor
  module REST
    class SearchBuilder
      attr_reader :keys, :params

      def initialize(params, *keys)
        @params = params
        @keys = keys.any? ? allowed_params & keys : allowed_params
      end

      def request
        built
          .merge(Multicolor::Util.build_colors(built.delete(:colors)))
          .merge(return_metadata: built.delete(:return_metadata).to_json) # son of a bitch
          .delete_if{ |k,v| v.nil? }
      end

      private

      def built
        @built ||= params.slice(*keys)
      end

      def allowed_params
        [
         :filepath,
         :colors,
         :weights,
         :ignore_background,
         :ignore_interior_background,
         :return_metadata,
         :metadata,
         :min_score,
         :offset,
         :limit
        ]
      end
    end
  end
end
