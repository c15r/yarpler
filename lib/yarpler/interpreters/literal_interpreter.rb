module Yarpler
  module Interpreters
    # LiteralInterpreter processes a YARPL literal
    # Literals can be for example integers or booleans
    class LiteralInterpreter
      attr_accessor :literal

      # Initializes the instance
      def initialize(item)
        process_literal(item)
      end

      # Processes a literal
      def process_literal(item)
        @literal = Yarpler::Models::Literal.new
        value = item[0].to_s
        # Date
        if /(\d{1,2})\.(\d{1,2})\.(\d{4})/.match value
          value = Date.parse(value).to_time.to_i.to_s
        elsif /(\d{1,2})\.(\d{1,2})\.(\d{4}\+\d{1,2})\:(\d{1,2})\:(\d{1,2})/.match value
          value = Date.parse(value).to_time.to_i.to_s
        end
        @literal.value = value
      end
    end
  end
end
