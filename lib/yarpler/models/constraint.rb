module Yarpler
  module Models
    ##
    # Model for a constraint
    class Constraint
      attr_accessor :expression

      # Initializes the model object
      def initialize
        @expression = nil
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      def valid?
        @expression.valid?
      end

      # Clones the object
      def clone
        new = Constraint.new
        new.expression = @expression.clone
        new
      end
    end
  end
end
