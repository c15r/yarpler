module Yarpler
  module Interpreter
    class ConstraintInterpreter

      def constraint
        @constraint
      end

      def initialize(tree)
        @constraint = Yarpler::Datastructure::Constraint.new
        parse_expression(tree)
      end

      private

      def parse_expression(expressions)
        expressions.each do |expression|
          expInt = ExpressionInterpreter.new(expression)
          @constraint.expressions << expInt.expression
        end
      end

    end
  end
end
