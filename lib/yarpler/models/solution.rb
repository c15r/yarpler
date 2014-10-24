module Yarpler
  module Models
    class Solution

      attr_accessor :ast
      attr_accessor :model
      attr_accessor :output

      def initialize
        @ast = ''
        @model = ''
        @output = ''
      end
    end
  end
end