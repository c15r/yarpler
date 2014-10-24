module Yarpler
  module Models
    ##
    # Field model for a single instance and attribute connection
    class Field
      attr_accessor :variable
      attr_accessor :attribute

      def initialize
      end

      def valid?
        !(@variable.nil? || @attribute.nil?)
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
