module Yarpler
  module Models
    ##
    # Model for an operator symobl
    class Operator
      attr_reader :operator

      # List of all valid operators
      OPERATORS = %w(== != >= <= < > + - * / AND OR IN)

      # Initializes the model object
      def initialize(operator)
        @operator = operator
      end

      # checks if the provided string is a valid operator
      def self.operator?(operator)
        OPERATORS.include?(operator.upcase)
      end

      # Converts the operator to a string
      def to_s
        @operator
      end

      # Clones the object
      def clone
        new = Operator.new(@operator.clone)
        new
      end
    end
  end
end
