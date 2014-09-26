module Yarpler
  module Datastructure

    OPERATORS = ['==']

    class Operator

      attr_reader :operator

      def initialize(operator)
        @operator = operator
      end

      def self.operator?(operator)
        OPERATORS.include?(operator)
      end
    end
  end
end