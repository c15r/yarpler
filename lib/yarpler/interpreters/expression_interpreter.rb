module Yarpler
  module Interpreters
    # ExpressionInterpreter processes a YARPL expression which is typically a boolean expression
    #
    # == YARPL Example
    #
    #   m.istarbeitszeit - m.sollarbeitszeit == m.differenz
    #
    # Currently supported are the following expressions:
    # FIELD_ACCESSOR
    # INDEX_ACCESSOR
    # FUNCTION_EXPRESSION
    # EXPRESSION
    # LITERAL
    # ABS_EXPRESSION
    # NOT_EXPRESSION
    class ExpressionInterpreter
      attr_reader :expression

      # Initializes the interpreter
      def initialize(tree, objects=nil)
        @expression = Yarpler::Models::Expression.new
        @objects = objects
        process_expression(tree)
      end

      private

      # Processes an expression
      def process_expression(expression)
        # fix unlimited stack of expression
        if expression[0].to_s == 'EXPRESSION' && expression.size == 1
          process_expression(expression[0])
        elsif expression[0].to_s == 'NOT_EXPRESSION' && expression.size == 1
          process_not_operator_expression(expression)
        elsif expression.size == 1
          process_no_operator_expression(expression)
        else
          process_normal_expression(expression)
        end
      end

      # Process an expression with not
      def process_not_operator_expression(expression)
        @expression.left = process_expression_item(expression[0])
        @expression.operator = 'NOT'
      end

      # Processes an operatorless expression
      def process_no_operator_expression(expression)
        @expression.left = process_expression_item(expression[0])
        @expression.operator = 'LITERAL'
      end

      # Processes a default expression
      def process_normal_expression(expression)
        # Guard Clasue
        return false unless Yarpler::Models::Operator.operator?(expression[1].to_s)

        @expression.operator = Yarpler::Models::Operator.new(expression[1].to_s)
        @expression.left = process_expression_item(expression[0])

        # allow multiple expression of the same cardinality
        if expression.size == 3
          @expression.right = process_expression_item(expression[2])
        else
          @expression.right = ExpressionInterpreter.new(expression[2..expression.size]).expression
        end
      end

      # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
      # Processes the expression item
      def process_expression_item(item)
        case item.to_s
          when 'FIELD_ACCESSOR'
            FieldAccessorInterpreter.new(item).field
          when 'INDEX_ACCESSOR'
            IndexAccessorInterpreter.new(item).index
          when 'FUNCTION_EXPRESSION'
            FunctionInterpreter.new(item, @objects).function
          when 'EXPRESSION'
            ExpressionInterpreter.new(item).expression
          when 'LITERAL'
            LiteralInterpreter.new(item).literal
          when 'ABS_EXPRESSION'
            AbsoluteInterpreter.new(item).absolute
          when 'NOT_EXPRESSION'
            NotInterpreter.new(item).not
        end
      end
      # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength
    end
  end
end
