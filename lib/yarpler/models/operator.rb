module Yarpler
  module Models
    ##
    # Model for an operator symobl
    class Operator
      attr_reader :operator

      OPERATORS = %w(== != >= <= + - * / AND OR IN)

      def initialize(operator)
        @operator = operator
      end

      def self.operator?(operator)
        OPERATORS.include?(operator.upcase)
      end

      def to_s
        @operator
      end

      def clone
        new = Operator.new(@operator.clone)
        new
      end
    end
  end
end
