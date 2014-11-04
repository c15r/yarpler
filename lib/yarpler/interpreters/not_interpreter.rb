module Yarpler
  module Interpreters
    # NotInterpreter processes a YARPL not expression
    #
    # == YARPL Example
    #
    #   not(d1 in m1.dienste)
    #
    class NotInterpreter
      attr_reader :not

      def initialize(tree)
        @not = Yarpler::Models::Not.new
        process_not(tree)
      end

      private

      def process_not(expression)
        @not.expression = Yarpler::Interpreters::ExpressionInterpreter.new(expression).expression
      end
    end
  end
end
