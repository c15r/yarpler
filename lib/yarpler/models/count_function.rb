module Yarpler
  module Models
    class CountFunction < Function
      attr_accessor :element
      attr_accessor :range

      def initialize
      end

      def valid?
        not @element.nil? || @range.nil?
      end

      def clone
        new = CountFunction.new
        new.element = @element.clone
        new.range = @range.clone
        new
      end
    end
  end
end
