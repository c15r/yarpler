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

        # fix unlimited stack of expression
        if expression[0].to_s == 'EXPRESSION' && expression.size == 1
          process_expression(expression[0])
        else
          if expression.size == 1
            process_no_operator_expression(expression)
          else
            process_normal_expression(expression)
          end
        end
      end

      def process_no_operator_expression(expression)
          @expression.left = process_expression_item(expression[0])
          @expression.operator = "LITERAL"
      end

      def process_normal_expression(expression)
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
          when 'FUNCTION_EXPRESSION'
            FunctionInterpreter.new(item).function
          when 'EXPRESSION'
            ExpressionInterpreter.new(item).expression
          when 'LITERAL'
            LiteralInterpreter.new(item).literal
        end
      end
    end
  end
end
