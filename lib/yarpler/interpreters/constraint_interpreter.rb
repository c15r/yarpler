module Yarpler
  module Interpreters
    # ConstraintInterpreter is responsible for interpreting YARPL constraints
    class ConstraintInterpreter
      attr_reader :constraint

      # Inizialize the interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @param objects [Hash<String, Object>] hash map of all yarpl objects
      # @return [void]
      def initialize(tree, objects)
        @objects = objects
        @constraint = Yarpler::Models::Constraint.new
        @constraint.expression = parse_expression(tree)
      end

      private

      # Parses a single expression
      #
      # @param expression [ANTLR3::AST::CommonTree] constraint expression parsed by antlr
      # @return [Yarpler::Models::Constraint] interpreted constraint object
      def parse_expression(expression)
        constraint = nil
        case expression[0].to_s
          when 'FORALL'
            interpreter = ForallInterpreter.new(expression[0], @objects)
            constraint = interpreter.forall
          when 'CONSTRAINT_EXPRESSION'
            interpreter = ExpressionInterpreter.new(expression[0], @objects)
            constraint = interpreter.expression
        end
        constraint
      end
    end
  end
end
