module Yarpler
  module Models
    ##
    # Model for a sum value function. Sum value function can be used to sum all attributes of a certain type.
    class SumValueFunction < Function
      attr_accessor :elements
      attr_accessor :set
      attr_accessor :attribute

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
        if @elements.is_a?(Yarpler::Models::Relation)
          valid = @elements.to.size > 1
        else
          valid = @elements.valid?
        end

        !@attribute.nil? && !@set.nil? && valid
      end

      # Clones the object
      #
      # @return [Yarpler::Models::SumValueFunction]
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
