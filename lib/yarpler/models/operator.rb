module Yarpler
  module Models
    OPERATORS = %w(== != >= <= + * AND IN)

    class Operator
      attr_reader :operator

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
