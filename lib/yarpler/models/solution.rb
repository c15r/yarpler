module Yarpler
  module Models
    ##
    # Main model object that holds all instances of objects
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
