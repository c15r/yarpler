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

      # Initializes the model object
      #
      # @return [void]
      def initialize
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      #
      # @return [Boolean]
      def valid?
        !(@element.nil? || @range.nil?)
      end

      # Clones the object
      #
      # @return [Yarpler::Models::CountFunction]
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
