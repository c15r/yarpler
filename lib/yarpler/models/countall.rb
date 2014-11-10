module Yarpler
  module Models
    # Countall model to encapsulate a loop.
    # This model can not be translated to a solver and has to be flattened before.
    class Countall
      attr_accessor :range
      attr_accessor :variable
      attr_accessor :expression
      attr_accessor :comparison

      def initialize
      end

      def clone
        new = Forall.new
        new.range = @range.clone
        new.variable = @variable.clone
        new.expression = @expression.clone
        new.comparison = @comparison.clone
        new
      end
    end
  end
end
