module Yarpler
  module Models
    class Problem
      attr_accessor :objects
      attr_accessor :constraints

      def initialize
        @objects = {}
        @constraints = []
      end

      def get_objects_of_class(class_name)
        var_array = []
        @objects.each do |_k, v|
          if v.class.to_s == class_name.to_s
            var_array.push(v)
          end
        end
        var_array
      end
    end
  end
end
