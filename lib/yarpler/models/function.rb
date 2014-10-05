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
    end

    class SumFunction < Function

      attr_accessor :elements

      def initialize
        @elements = Array.new
      end

    end
  end
end