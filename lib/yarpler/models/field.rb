module Yarpler
  module Models
    ##
    # Field model for a single instance and attribute connection
    class Field
      attr_accessor :variable
      attr_accessor :attribute

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
        !(@variable.nil? || @attribute.nil?)
      end

      # Clones the object
      #
      # @return [Yarpler::Models::Field]
      def clone
        new = Field.new
        new.variable = @variable.clone
        new.attribute = @attribute.clone
        new
      end
    end
  end
end
