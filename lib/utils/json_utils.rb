require "json"

module Utils
  module JsonUtils
    class << self
      def parse_json(json_string)
        JSON.parse(json_string)
      end
    end
  end
end
