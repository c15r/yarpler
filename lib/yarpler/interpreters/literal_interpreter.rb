module Yarpler
  module Interpreters
    # LiteralInterpreter processes a YARPL literal
    # Literals can be for example integers or booleans
    class LiteralInterpreter
      attr_accessor :literal

      def initialize(item)
        process_literal(item)
      end

      def process_literal(item)
        @literal = Yarpler::Models::Literal.new
        @literal.value = item[0].to_s
      end
    end
  end
end
