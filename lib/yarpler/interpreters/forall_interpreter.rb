module Yarpler
  module Interpreters
    class ForallInterpreter
      attr_reader :forall

      def initialize(tree, objects)
        @objects = objects
        @forall = Yarpler::Models::Forall.new
        process_forall(tree)
      end

      private

      def process_forall(expression)
        forall_selector(expression[0])
        @forall.expression = ExpressionInterpreter.new(expression[1]).expression
      end

      def forall_selector(expression)
        case expression.to_s
          when 'IN'
            @forall.range = forall_range_builder(expression[1])
            @forall.variable = expression[0].to_s
        end
      end

      def forall_range_builder(expression)
        range = []
        case expression.to_s
          when 'FIELD_ACCESSOR'
            # Access to all objects of class
            if expression.size == 1 && class_exists?(expression[0].to_s)
              range = get_objects_of_class(expression[0].to_s)
            end
        end
        range
      end

      def class_exists?(class_name)
        klass = Object.const_get(class_name)
        return klass.is_a?(Class)
      rescue NameError
        return false
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
