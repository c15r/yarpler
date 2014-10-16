module Yarpler
  module Interpreter
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
