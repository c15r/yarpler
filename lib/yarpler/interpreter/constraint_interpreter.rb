module Yarpler
  module Interpreter
    class ConstraintInterpreter
      attr_reader :constraint

      def initialize(tree, objects)
        @objects = objects
        @constraint = Yarpler::Models::Constraint.new
        @constraint.expression = parse_expression(tree)
      end

      private

      def parse_expression(expression)
        constraint = nil
        case expression[0].to_s
          when 'FORALL'
            interpreter = ForallInterpreter.new(expression[0], @objects)
            if interpreter.constraints.nil?
              constraint = interpreter.forall
            else
              constraint = interpreter.constraints
            end
          when 'CONSTRAINT_EXPRESSION'
            interpreter = ExpressionInterpreter.new(expression[0])
            constraint = interpreter.expression
        end
        constraint
      end
    end
  end
end
