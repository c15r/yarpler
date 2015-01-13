module Yarpler
  module Models
    ##
    # Model for sum function that sums up a list of expressions
    class SumFunction < Function
      attr_accessor :elements

      # Initializes the model object
      #
      # @return [void]
      def initialize
        @elements = []
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      #
      # @return [Boolean]
      def valid?
        @elements.size > 0
      end

      # Clones the object
      #
      # @return [Yarpler::Models::SumFunction]
      def clone
        new = SumFunction.new
        new.elements = @elements.clone
        new
      end
    end
  end
end
