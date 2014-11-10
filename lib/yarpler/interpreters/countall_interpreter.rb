module Yarpler
  module Interpreters
    # CountallInterpreter processes a YARPL Allquantor statement
    # and counts items according to the expression
    #
    # == YARPL Example
    #
    #   countAll(...) { ... } == <expression>
    #
    class CountallInterpreter
      attr_reader :countAll
      attr_reader :constraints

      def initialize(tree, objects, parent = nil)
        @objects = objects
        @countAll = Yarpler::Models::Countall.new
        @parent = parent
        @constraints = nil
        process_countall(tree)
      end

      private

      def process_countall(expression)
        countall_selector(expression[0])
        if expression[1].to_s == 'FORALL'
          @countAll.expression = ForallInterpreter.new(expression[1], @objects, @countAll).forall
        else
          #@countAll.expression = ExpressionInterpreter.new(expression[1], @objects).expression
        end
      end

      def countall_selector(expression)
        case expression.to_s
          when 'IN'
            @countAll.range = countall_range_builder(expression[1])
            @countAll.variable = expression[0].to_s
        end
      end

      def countall_range_builder(expression)
        range = []
        case expression.to_s
          when 'FIELD_ACCESSOR'
            # Access to all objects of class
            if expression.size == 1 && class_exists?(expression[0].to_s)
              range = get_objects_of_class(expression[0].to_s)
            else
              range = FieldAccessorInterpreter.new(expression).field
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
          var_array.push(v) if (v.class.to_s == class_name.to_s)
        end
        var_array
      end
    end
  end
end
