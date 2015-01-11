module Yarpler
  module Interpreters
    # ForallInterpreter processes a YARPL Allquantor statement
    #
    # == YARPL Example
    #
    #   forall(...) { ... }
    #
    class ForallInterpreter
      attr_reader :forall
      attr_reader :constraints
      attr_reader :where

      # Initializes the interpreter
      def initialize(tree, objects, parent = nil)
        @objects = objects
        @forall = Yarpler::Models::Forall.new
        @parent = parent
        @where = nil
        @order = nil
        @constraints = nil
        process_forall(tree)
      end

      private

      # Processes the forall loop
      def process_forall(expression)
        process_filters(expression)
        @forall.where = @where
        @forall.order = @order
        forall_selector(expression[0])
        if expression[1].to_s == 'FORALL'
          @forall.expression = ForallInterpreter.new(expression[1], @objects, @forall).forall
        else
          @forall.expression = ExpressionInterpreter.new(expression[1]).expression
        end
      end

      # Processes the filters
      def process_filters(expression)
        return if expression.size <= 2

        expression[2..expression.size].each do |e|
          if e.to_s == 'WHERE'
            @where = ExpressionInterpreter.new(e).expression
          elsif e.to_s == 'ORDER_ASC'
            process_order_asc(e)
          elsif e.to_s == 'ORDER_DESC'
            process_order_desc(e)
          end
        end
      end

      # Processes the order by desc
      def process_order_desc(e)
        @order = Yarpler::Models::Order.new
        @order.field = FieldAccessorInterpreter.new(e[0]).field
        @order.type = 'DESC'
      end

      # Processes the order by asc
      def process_order_asc(e)
        @order = Yarpler::Models::Order.new
        @order.field = FieldAccessorInterpreter.new(e[0]).field
        @order.type = 'ASC'
      end

      # Processes the forall selector
      def forall_selector(expression)
        case expression.to_s
          when 'FROM'
            @forall.range = forall_range_builder(expression[1])
            @forall.field = FieldAccessorInterpreter.new(expression[1]).field
            @forall.variable = expression[0].to_s
        end
      end

      # Builds the range
      def forall_range_builder(expression)
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

      # Checks if a class exists
      def class_exists?(class_name)
        klass = Object.const_get(class_name)
        return klass.is_a?(Class)
      rescue NameError
        return false
      end

      # Gets all object of a class by string
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
