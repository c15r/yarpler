module Yarpler
  module Interpreters
    # SolveInterpreter processes a YARPL solve block
    #
    # == YARPL Example
    #
    #   solve { ... }
    #
    # Currently the solve interpreter processes the following items:
    # Constraints, Statisfy, Minimize, Maximize
    class SolveInterpreter
      attr_accessor :solve
      attr_accessor :constraints

      # Initializes the interpreter
      def initialize(tree, objects)
        @constraints = []
        @objects = objects
        @solve = Yarpler::Models::SolveInstruction.new
        tree_converter(tree)
      end

      # Converts a tree
      def tree_converter(tree)
        tree.each do |item|
          interpret_statement(item)
        end
      end

      private

      # Interprets a statement
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

      # Interprets a constraint
      def interpret_constraint(constraint)
        constraint_interpreter = ConstraintInterpreter.new(constraint, @objects)
        @constraints.push(constraint_interpreter.constraint)
      end

      # Interprets a satisfy
      def interpret_satisfy(statement)
        @solve.statement = statement.to_s
      end

      # Interprets a minimize
      def interpret_minimize(statement)
        @solve.statement = statement.to_s
        @solve.expression = ExpressionInterpreter.new(statement[0]).expression
      end

      # Interprets a maximize
      def interpret_maximize(statement)
        @solve.statement = statement.to_s
        @solve.expression = ExpressionInterpreter.new(statement[0]).expression
      end
    end
  end
end
