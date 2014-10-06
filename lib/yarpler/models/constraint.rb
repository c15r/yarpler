module Yarpler
  module Models
    class Constraint
      attr_reader :expressions

      def initialize
        @expressions = []
      end
    end
  end
end
