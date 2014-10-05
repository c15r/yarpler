module Yarpler
  module Models
    class Instance

      attr_accessor :variable

      def initialize
        @variable = ''
      end

      def to_s
        @variable + '_id'
      end
    end
  end
end