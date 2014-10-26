module Yarpler
  module Interpreters
    ##
    # Interpreter for the solve block
    #   solve { }
    class SolveInterpreter
      attr_accessor :solve
      attr_accessor :constraints

      def initialize(tree, objects)
        @constraints = []
        @objects = objects
        @solve = Yarpler::Models::SolveInstruction.new
        tree_converter(tree)
      end

      def tree_converter(tree)
        tree.each do |item|
          interpret_statement(item)
        end
      end

      private

      def interpret_statement(statement)
        case statement.to_s
          when 'CONSTRAINT_DECLARATION'
            interpret_constraint(statement)
          when 'SATISFY'
            interpret_satisfy(statement)
          when 'MINIMIZE'
            interpret_minimize(statement)
          when 'MAXIMIZE'
            interpret_maximize(statement)
        end
      end

      def interpret_constraint(constraint)
        constraint_interpreter = ConstraintInterpreter.new(constraint, @objects)
        @constraints.push(constraint_interpreter.constraint)
      end

      def interpret_satisfy(statement)
        @solve.statement = statement.to_s
      end

      def interpret_minimize(statement)
        @solve.statement = statement.to_s
        @solve.expression = ExpressionInterpreter.new(statement[0]).expression
      end

      def interpret_maximize(statement)
        @solve.statement = statement.to_s
        @solve.expression = ExpressionInterpreter.new(statement[0]).expression
      end
    end
  end
end
