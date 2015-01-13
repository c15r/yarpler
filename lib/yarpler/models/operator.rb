module Yarpler
  module Models
    ##
    # Model for an operator symobl
    class Operator
      attr_reader :operator

      # List of all valid operators
      OPERATORS = %w(== != >= <= < > + - * / AND OR IN)

      # Initializes the model object
      #
      # @return [void]
      def initialize(operator)
        @operator = operator
      end

      # checks if the provided string is a valid operator
      #
      # @return [Boolean]
      def self.operator?(operator)
        OPERATORS.include?(operator.upcase)
      end

      # Converts the operator to a string
      #
      # @return [String]
      def to_s
        @operator
      end

      # Clones the object
      #
      # @return [String]
      def clone
        new = Operator.new(@operator.clone)
        new
      end
    end
  end
end
