module Yarpler
  module Interpreter
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
            @absolute.expression=Yarpler::Interpreter::FieldAccessorInterpreter.new(expression[0]).field
          when 'EXPRESSION'
            @absolute.expression=Yarpler::Interpreter::ExpressionInterpreter.new(expression[0]).expression
        end

      end

    end
  end
end
