module Yarpler
  module Models
    ##
    # Model for an instance, that will always link to the attribute id
    class Instance
      attr_accessor :variable

      def initialize
        @variable = ''
      end

      def valid?
        !@variable.nil?
      end

      def clone
        new = Instance.new
        new.variable = @variable
        new
      end
    end
  end
end
