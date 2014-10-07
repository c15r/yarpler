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

          # allow multiple expression of the same cardinality
          if expression.size == 3
            @expression.right = process_expression_item(expression[2])
          else
            @expression.right = ExpressionInterpreter.new(expression[2..expression.size]).expression
          end

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
          when 'LITERAL'
            LiteralInterpreter.new(item).literal
        end
      end
    end

    class LiteralInterpreter

      attr_accessor :literal

      def initialize(item)
        process_literal(item)
      end

      def process_literal(item)
        @literal = Yarpler::Models::Literal.new
        @literal.value = item[0].to_s
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
