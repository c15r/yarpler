module Yarpler
  module Models
    class Function
      def initialize
      end
    end

    class CountFunction < Function
      attr_accessor :element
      attr_accessor :range

      def initialize
      end

      def clone
        new=CountFunction.new
        new.element=@element.clone
        new.range=@range.clone
        new
      end
    end

    class SumFunction < Function
      attr_accessor :elements

      def initialize
        @elements = []
      end

      def clone
        new=SumFunction.new
        new.elements=@elements.clone
        new
      end
    end
  end
end
