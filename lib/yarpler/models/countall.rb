module Yarpler
  module Models
    # Countall model to encapsulate a loop.
    # This model can not be translated to a solver and has to be flattened before.
    class Countall < Function
      attr_accessor :range
      attr_accessor :variable
      attr_accessor :expression
      attr_accessor :comparison

      def initialize
      end

      def clone
        new = Countall.new
        new.range = @range.clone
        new.variable = @variable.clone
        new.expression = @expression.clone
        new.comparison = @comparison.clone
        new
      end

      def valid?
        true
      end
    end
  end
end
