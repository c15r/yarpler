module Yarpler
  module Models
    class Instance
      attr_accessor :variable

      def initialize
        @variable = ''
      end

      def valid?
        not @variable.nil?
      end

      def clone
        new = Instance.new
        new.variable = @variable
        new
      end
    end
  end
end
