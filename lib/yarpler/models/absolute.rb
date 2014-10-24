module Yarpler
  module Models
    ##
    # Model for an absolute expression which can be used to minimize values to 0
    class Absolute
      attr_accessor :expression

      def initialize
      end

      def valid?
        @expression.valid?
      end

      def clone
        new = Absolute.new
        new.expression = @expression.clone
        new
      end
    end
  end
end
