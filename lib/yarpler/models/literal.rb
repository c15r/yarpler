module Yarpler
  module Models
    ##
    # Model for a literal value like an INTEGER
    class Literal
      attr_accessor :value

      def initialize
      end

      def valid?
        !@value.nil?
      end

      def clone
        new = Literal.new
        new.value = @value.clone
        new
      end
    end
  end
end
