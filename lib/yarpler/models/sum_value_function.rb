module Yarpler
  module Models
    class SumValueFunction < Function
      attr_accessor :elements
      attr_accessor :set
      attr_accessor :attribute

      def initialize
        @elements = []
      end

      def clone
        new = SumValueFunction.new
        new.elements = @elements.clone
        new.attribute = @attribute.clone
        new.set = @set.clone
        new
      end
    end
  end
end
