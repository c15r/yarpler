module Yarpler
  module Models
    ##
    # Forall model to encapsulate a loop. This model can not be translated to a solver and has to be flattened before.
    class Forall
      attr_accessor :range
      attr_accessor :field
      attr_accessor :variable
      attr_accessor :expression
      attr_accessor :where
      attr_accessor :order

      # Initializes the model object
      #
      # @return [void]
      def initialize
      end

      # Clones the object
      #
      # @return [Yarpler::Models::Forall]
      def clone
        new = Forall.new
        new.range = @range.clone
        new.variable = @variable.clone
        new.expression = @expression.clone
        new.where = @where.clone unless @where.nil?
        new.order = @order.clone unless @order.nil?
        new.field = @field.clone unless @field.nil?
        new
      end
    end
  end
end
