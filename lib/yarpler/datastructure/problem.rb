module Yarpler
  module Datastructure
    class Problem

      attr_accessor :objects
      attr_accessor :constraints

      def initialize
        @objects = Hash.new
        @constraints = Array.new
      end

    end
  end
end