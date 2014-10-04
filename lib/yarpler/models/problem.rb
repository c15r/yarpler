module Yarpler
  module Models
    class Problem

      attr_accessor :objects
      attr_accessor :constraints

      def initialize
        @objects = Hash.new
        @constraints = Array.new
      end

      def get_objects_of_class(class_name)
        var_array = Array.new
        @objects.each do |k,v|
          if v.class.to_s == class_name.to_s
            var_array.push(v)
          end
        end
        var_array
      end

    end
  end
end