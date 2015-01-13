module Yarpler
  module Models
    ##
    # Model for a constraint
    class Constraint
      attr_accessor :expression

      # Initializes the model object
      #
      # @return [void]
      def initialize
        @expression = nil
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      #
      # @return [Boolean]
      def valid?
        @expression.valid?
      end

      # Clones the object
      #
      # @return [Yarpler::Models::Constraint]
      def clone
        new = Constraint.new
        new.expression = @expression.clone
        new
      end
    end
  end
end
