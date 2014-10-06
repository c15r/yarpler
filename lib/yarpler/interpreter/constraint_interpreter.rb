module Yarpler
  module Interpreter
    class ConstraintInterpreter
      attr_reader :constraint

      def initialize(tree)
        @constraint = Yarpler::Models::Constraint.new
        parse_expression(tree)
      end

      private

      def parse_expression(expressions)
        expressions.each do |expression|
          expression_interpreter = ExpressionInterpreter.new(expression)
          @constraint.expressions << expression_interpreter.expression
        end
      end
    end
  end
end
