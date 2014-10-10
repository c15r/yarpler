module Yarpler
  module Interpreter
    ##
    # Interpreter for the solve block
    #   solve { }
    class SolveInterpreter
      attr_accessor :solve
      attr_accessor :constraints

      def initialize(tree)
        @constraints = []
        @solve = Yarpler::Models::SolveInstruction.new
        tree_converter(tree)
      end

      def tree_converter(tree)
        tree.each do |item|
          case item.to_s
            when 'CONSTRAINT_DECLARATION'
              constraint_interpreter = ConstraintInterpreter.new(item, @objects)
              @constraints.push(constraint_interpreter.constraint)
            when 'SATISFY'
              @solve.statement = item.to_s
            when 'MINIMIZE'
              @solve.statement = item.to_s
              @solve.expression = ExpressionInterpreter.new(item[0]).expression
            when 'MAXIMIZE'
              @solve.statement = item.to_s
              @solve.expression = ExpressionInterpreter.new(item[0]).expression
          end
        end
      end
    end
  end
end