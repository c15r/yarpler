module Yarpler
  module Interpreter
    ##
    # Interpreter for the solve block
    #   solve { }
    class SolveInterpreter
      attr_accessor :solve

      def initialize(tree)
        tree_converter(tree)
      end

      def tree_converter(tree)
        @solve = Yarpler::Models::SolveInstruction.new
        case tree[0].to_s
          when 'SATISFY'
            @solve.statement = tree[0].to_s
          when 'MINIMIZE'
            @solve.statement = tree[0].to_s
            @solve.expression = ExpressionInterpreter.new(tree[1]).expression
          when 'MAXIMIZE'
            @solve.statement = tree[0].to_s
            @solve.expression = ExpressionInterpreter.new(tree[1]).expression
        end
      end
    end
  end
end