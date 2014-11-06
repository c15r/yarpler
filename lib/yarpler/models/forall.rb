module Yarpler
  module Models
    ##
    # Forall model to encapsulate a loop. This model can not be translated to a solver and has to be flattened before.
    class Forall
      attr_accessor :range
      attr_accessor :variable
      attr_accessor :expression
      attr_accessor :where
      attr_accessor :order

      def initialize
      end

      def clone
        new = Forall.new
        new.range = @range.clone
        new.variable = @variable.clone
        new.expression = @expression.clone
        new.where = @where.clone if not @where.nil?
        new.order = @order.clone if not @order.nil?
        new
      end
    end
  end
end
