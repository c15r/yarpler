module Yarpler
  module Models
    ##
    # Model for a Cardinality function. Cardinality function is used to count the number of values
    # in a set
    class Cardinality < Function
      attr_accessor :element

      # Initializes the model object
      def initialize
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      def valid?
        !@element.nil?
      end

      # Clones the object
      def clone
        new = Cardinality.new
        new.element = @element.clone
        new
      end
    end
  end
end
