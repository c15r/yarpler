module Yarpler
  module Models
    class Constraint
      attr_accessor :expression

      def initialize
        @expression = nil
      end

      def clone
        new=Constraint.new
        new.expression=@expression.clone
        new
      end
    end
  end
end
