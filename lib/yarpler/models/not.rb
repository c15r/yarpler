module Yarpler
  module Models
    ##
    # Model for a not expression which can be used to negate expressions not(true) == false
    class Not
      attr_accessor :expression

      def initialize
      end

      def valid?
        @expression.valid?
      end

      def clone
        new = Not.new
        new.expression = @expression.clone
        new
      end
    end
  end
end
