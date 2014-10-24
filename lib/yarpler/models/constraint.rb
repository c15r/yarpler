module Yarpler
  module Models
    ##
    # Model for a constraint
    class Constraint
      attr_accessor :expression

      def initialize
        @expression = nil
      end

      def valid?
        @expression.valid?
      end

      def clone
        new = Constraint.new
        new.expression = @expression.clone
        new
      end
    end
  end
end
