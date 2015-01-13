module Yarpler
  module Models
    ##
    # Model for an instance, that will always link to the attribute id
    class Instance
      attr_accessor :variable

      # Initializes the model object
      #
      # @return [void]
      def initialize
        @variable = ''
      end

      # Checks the validity of the object and if all required
      # fields are initialized
      #
      # @return [Boolean]
      def valid?
        !@variable.nil?
      end

      # Clones the object
      #
      # @return [Yarpler::Models::Instance]
      def clone
        new = Instance.new
        new.variable = @variable
        new
      end
    end
  end
end
