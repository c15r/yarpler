module Yarpler
  module Models
    class Forall
      attr_accessor :range
      attr_accessor :variable
      attr_accessor :expression

      def initialize
      end

      def clone
        new = Forall.new
        new.range = @range.clone
        new.variable = @variable.clone
        new.expression = @expression.clone
        new
      end
    end
  end
end
