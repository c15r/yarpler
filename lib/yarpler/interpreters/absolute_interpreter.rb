module Yarpler
  module Interpreters
    # AbsoluteInterpreter processes a YARPL absolute expression
    #
    # == YARPL Example
    #
    #   abs(m1.differenz)
    #
    class AbsoluteInterpreter
      attr_reader :absolute

      def initialize(tree)
        @absolute = Yarpler::Models::Absolute.new
        process_absolute(tree)
      end

      private

      def process_absolute(expression)
        case expression[0].to_s
          when 'FIELD_ACCESSOR'
            @absolute.expression = Yarpler::Interpreters::FieldAccessorInterpreter.new(expression[0]).field
          when 'EXPRESSION'
            @absolute.expression = Yarpler::Interpreters::ExpressionInterpreter.new(expression[0]).expression
        end
      end
    end
  end
end
