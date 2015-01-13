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

      # Initializes the model object
      #
      # @return [void]
      def initialize
        @expressions = Array.new
      end

      # Clones the object
      #
      # @return [Yarpler::Models::Countall]
      def clone
        new = Countall.new
        new.range = @range.clone
        new.variable = @variable.clone
        new.expression = @expression.clone
        new.expressions = @expressions.clone
        new.field = @field.clone
        new
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      #
      # @return [Boolean]
      def valid?
        true
      end
    end
  end
end
