module Yarpler
  ##
  # Model module with all data structures
  # for the internal data of a problem
  module Models
    ##
    # Model for an absolute expression which can be used to minimize values to 0
    class Absolute

      # Expression for the absolute construct
      attr_accessor :expression

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
        @expression.valid?
      end

      # Clones the object
      #
      # @return [Yarpler::Models::Absolute]
      def clone
        new = Absolute.new
        new.expression = @expression.clone
        new
      end
    end
  end
end
