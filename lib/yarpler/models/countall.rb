module Yarpler
  module Models
    # Countall model to encapsulate a loop.
    # This model can not be translated to a solver and has to be flattened before.
    class Countall < Function
      attr_accessor :range
      attr_accessor :variable
      attr_accessor :expression
      attr_accessor :expressions
      attr_accessor :field

      def initialize
        @expressions = Array.new
      end

      def clone
        new = Countall.new
        new.range = @range.clone
        new.variable = @variable.clone
        new.expression = @expression.clone
        new.expressions = @expressions.clone
        new.field = @field.clone
        new
      end

      def valid?
        true
      end
    end
  end
end
