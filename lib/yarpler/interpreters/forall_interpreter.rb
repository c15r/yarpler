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

      def process_filters(expression)
        return if expression.size <=2

        for i in 2..expression.size
          if expression[i].to_s == 'WHERE'
            @where = ExpressionInterpreter.new(expression[i]).expression
          elsif expression[i].to_s == 'ORDER_ASC'
            @order = Yarpler::Models::Order.new
            @order.field = FieldAccessorInterpreter.new(expression[i][0]).field
            @order.type = 'ASC'
          elsif expression[i].to_s == 'ORDER_DESC'
            @order = Yarpler::Models::Order.new
            @order.field = FieldAccessorInterpreter.new(expression[i][0]).field
            @order.type = 'DESC'
          end
        end
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
