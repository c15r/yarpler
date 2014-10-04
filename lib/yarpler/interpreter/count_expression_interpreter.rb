module Yarpler
  module Interpreter
    class CountExpressionInterpreter

      def expression
        @expression
      end

      def initialize(tree)
        @expression = Yarpler::Models::Expression.new
        process_expression(tree)
      end

      private

      def process_expression(expression)
        #expression.each do |item|
          if Yarpler::Models::Operator.operator?(expression[1].to_s)
            @expression.operator = Yarpler::Models::Operator.new(expression[1].to_s)
            @expression.left = process_expression_item(expression[0])
            @expression.right = process_expression_item(expression[2])
          end
        #end
      end

      def process_expression_item(item)

        FieldAccessorInterpreter.new(item).field

        #case item.to_s
        #  when 'FIELD_ACCESSOR'
        #    FieldAccessorInterpreter.new(item).field
        #  when 'EXPRESSION'
        #    ExpressionInterpreter.new(item)
        #  when 'COUNT_EXPRESSION'
        #    CountExpressionInterpreter.new(item)
        #end
      end

    end
  end
end
