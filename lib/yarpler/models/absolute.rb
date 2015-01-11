module Yarpler
  module Models
    ##
    # Model for an absolute expression which can be used to minimize values to 0
    class Absolute
      attr_accessor :expression

      # Initializes the model object
      def initialize
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      def valid?
        @expression.valid?
      end

      # Clones the object
      def clone
        new = Absolute.new
        new.expression = @expression.clone
        new
      end
    end
  end
end
