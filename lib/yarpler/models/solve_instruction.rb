module Yarpler
  module Models
    ##
    # Solve instruction contains a statement and if it is a minimize/maximize instruction an expression
    class SolveInstruction
      attr_accessor :statement
      attr_accessor :expression

      # Initializes the model object
      # @return [void]
      def initialize
      end

      # Clones the object
      # @return [Yarpler::Models::SolveInstruction]
      def clone
        new = SolveInstruction.new
        new.statement = @statement.clone
        new.expression = @expression.clone
        new
      end
    end
  end
end
