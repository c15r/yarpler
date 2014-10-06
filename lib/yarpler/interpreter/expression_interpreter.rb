module Yarpler
  module Interpreter
    class ExpressionInterpreter
      attr_reader :expression

      def initialize(tree)
        @expression = Yarpler::Models::Expression.new
        process_expression(tree)
      end

      private

      def process_expression(expression)
        if Yarpler::Models::Operator.operator?(expression[1].to_s)
          @expression.operator = Yarpler::Models::Operator.new(expression[1].to_s)
          @expression.left = process_expression_item(expression[0])
          @expression.right = process_expression_item(expression[2])
        end
      end

      def process_expression_item(item)
        case item.to_s
          when 'FIELD_ACCESSOR'
            FieldAccessorInterpreter.new(item).field
          when 'INSTANCE_ACCESSOR'
            InstanceInterpreter.new(item).instance
          when 'FUNCTION_EXPRESSION'
            FunctionInterpreter.new(item).function
          when 'EXPRESSION'
            ExpressionInterpreter.new(item).expression
        end
      end
    end

    class FieldAccessorInterpreter
      attr_accessor :field

      def initialize(item)
        process_field(item)
      end

      def process_field(item)
        @field = Yarpler::Models::Field.new
        @field.variable = item[0].to_s
        @field.attribute = item[1].to_s
      end
    end

    class InstanceInterpreter
      attr_accessor :instance

      def initialize(item)
        process_instance(item)
      end

      def process_instance(item)
        @instance = Yarpler::Models::Instance.new
        @instance.variable = item[0].to_s
      end
    end
  end
end
