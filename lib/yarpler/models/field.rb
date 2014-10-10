module Yarpler
  module Models
    class Field
      attr_accessor :variable
      attr_accessor :attribute

      def initialize
      end

      def clone
        new = Field.new
        new.variable = @variable.clone
        new.attribute = @attribute.clone
        new
      end
    end
  end
end
