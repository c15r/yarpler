module Yarpler
  module Models
    class SumValueFunction < Function
      attr_accessor :elements
      attr_accessor :set
      attr_accessor :attribute

      def initialize
        @elements = []
      end

      def valid?

        if @elements.is_a?(Yarpler::Models::Relation)
          valid = @elements.to.size > 1
        else
          valid = @elements.valid?
        end

        !@attribute.nil? && !@set.nil? && valid
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
