module Yarpler
  module Models
    class Literal
      attr_accessor :value

      def initialize
      end

      def valid?
        not @value.nil?
      end

      def clone
        new = Literal.new
        new.value = @value.clone
        new
      end
    end
  end
end
