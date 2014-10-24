module Yarpler
  module Models
    ##
    # Forall model to encapsulate a loop. This model can not be translated to a solver and has to be flattened before.
    class Forall
      attr_accessor :range
      attr_accessor :variable
      attr_accessor :expression

      def initialize
      end

      def clone
        new = Forall.new
        new.range = @range.clone
        new.variable = @variable.clone
        new.expression = @expression.clone
        new
      end
    end
  end
end
