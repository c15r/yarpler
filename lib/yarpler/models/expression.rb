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

      # Initializes the model object
      def initialize
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      def valid?
        valid = !@operator.nil?
        if @operator == 'NOT'
          valid &&= @left.valid?
        else
          valid &&= @left.valid? && @right.valid?
        end
        valid
      end

      # Clones the object
      def clone
        new = Expression.new
        new.operator = @operator.clone
        new.left = @left.clone
        new.right = @right.clone unless @right.nil?
        new
      end
    end
  end
end
