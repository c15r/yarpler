module Yarpler
  module Models
    class SumFunction < Function
      attr_accessor :elements

      def initialize
        @elements = []
      end

      def is_valid?
        elements.size > 0
      end

      def clone
        new = SumFunction.new
        new.elements = @elements.clone
        new
      end
    end
  end
end
