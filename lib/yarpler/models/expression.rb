module Yarpler
  module Models
    class Expression
      attr_accessor :operator
      attr_accessor :left
      attr_accessor :right

      def initialize
      end

      def clone
        new = Expression.new
        new.operator = @operator.clone
        new.left = @left.clone
        new.right = @right.clone
        new
      end
    end
  end
end
