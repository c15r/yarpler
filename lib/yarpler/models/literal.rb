module Yarpler
  module Models
    ##
    # Model for a literal value like an INTEGER
    class Literal
      attr_accessor :value

      # Initializes the model object
      def initialize
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      def valid?
        !@value.nil?
      end

      # Clones the object
      def clone
        new = Literal.new
        new.value = @value.clone
        new
      end
    end
  end
end
