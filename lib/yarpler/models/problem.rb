module Yarpler
  module Models
    ##
    # Stores the whole problem description
    class Problem
      include Singleton

      attr_accessor :objects
      attr_accessor :constraints
      attr_accessor :solve

      def initialize
        @objects = {}
        @constraints = []
      end

      ##
      # Gets an object of the instance by Class and the
      # representative ID of the object.
      def get_object_by_id(class_name, id)
        obj = nil
        get_objects_of_class(class_name).each do |o|
          if o.id == id
            obj = o
            break
          end
        end
        obj
      end

      ##
      # Gets a list of all objects of the instance of a certain type
      def get_objects_of_class(obj)
        var_array = []
        if obj.is_a? Yarpler::Models::Substitute
          get_objects_of_class(obj.variable).each do |o|
            var_array.concat(o.get_value(obj.attribute.to_s).to)
          end
          puts var_array.to_s
        else
          var_array=get_objects_of_class_by_class_name(obj)
        end
        var_array
      end

      private

      def get_objects_of_class_by_class_name(class_name)
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
