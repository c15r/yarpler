module Yarpler
  module Models
    class Instance
      attr_accessor :variable

      def initialize
        @variable = ''
      end

      def clone
        new=Instance.new
        new.variable=@variable
        new
      end
    end
  end
end
