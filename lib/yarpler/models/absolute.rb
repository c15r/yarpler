module Yarpler
  module Models
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
