module Yarpler
  module Models
    ##
    # Model for a Count function. Count function is used to count the number of occurences
    # of a value in a set of values
    class CountFunction < Function
      attr_accessor :element
      attr_accessor :range
      attr_accessor :where
      attr_accessor :inner

      def initialize
      end

      def valid?
        !(@element.nil? || @range.nil?)
      end

      def clone
        new = CountFunction.new
        new.element = @element.clone
        new.range = @range.clone
        new.where = @where.clone unless @where.nil?
        new.inner = @inner.clone unless @inner.nil?
        new
      end
    end
  end
end
