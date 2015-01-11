module Yarpler
  module Models
    ##
    # Model for a not expression which can be used to negate expressions not(true) == false
    class Not
      attr_accessor :expression

      # Initializes the model object
      def initialize
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      def valid?
        @expression.valid?
      end

      # Clones the object
      def clone
        new = Not.new
        new.expression = @expression.clone
        new
      end
    end
  end
end
