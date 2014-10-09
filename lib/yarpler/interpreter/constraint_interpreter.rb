module Yarpler
  module Interpreter
    class ConstraintInterpreter
      attr_reader :constraint

      def initialize(tree)
        @constraint = Yarpler::Models::Constraint.new
        @constraint.expressions << parse_expression(tree)
      end

      private

      def parse_expression(expression)
        constraint = nil
        case expression[0].to_s
          when 'FORALL'
            interpreter = ForallInterpreter.new(expression[0])
            constraint = interpreter.forall
          when 'CONSTRAINT_EXPRESSION'
            interpreter = ExpressionInterpreter.new(expression[0])
            constraint = interpreter.expression
        end
        constraint
      end
    end
  end
end
