module Yarpler
  module Models
    ##
    # Model for a expression node. Multiple expression build a binary tree with the
    # left and right attributes and guarantee a correct way of resolving the expression
    # when it is printed
    class Expression
      attr_accessor :operator
      attr_accessor :left
      attr_accessor :right

      def initialize
      end

      def valid?
        valid = !@operator.nil?
        valid && @left.valid? && @right.valid?
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
