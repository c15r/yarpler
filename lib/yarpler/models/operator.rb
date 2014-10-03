module Yarpler
  module Models

    OPERATORS = ['==', '+']

    class Operator

      attr_reader :operator

      def initialize(operator)
        @operator = operator
      end

      def self.operator?(operator)
        OPERATORS.include?(operator)
      end

      def to_s
        @operator
      end
    end
  end
end