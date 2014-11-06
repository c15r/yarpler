module Yarpler
  module Models
    ##
    # Model for a Cardinality function. Cardinality function is used to count the number of values
    # in a set
    class Cardinality < Function
      attr_accessor :element

      def initialize
      end

      def valid?
        !@element.nil?
      end

      def clone
        new = Cardinality.new
        new.element = @element.clone
        new
      end
    end
  end
end
