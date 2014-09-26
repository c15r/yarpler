module Yarpler
  module Interpreter
    class ExpressionInterpreter

      def expression
        @expression
      end

      def initialize(tree)
        @expression = Yarpler::Datastructure::Expression.new
        process_expression(tree)
      end

      private

      def process_expression(expression)
        expression.each do |item|
          if Yarpler::Datastructure::Operator.operator?(item.to_s)
            @expression.operator = Yarpler::Datastructure::Operator.new(item.to_s)
            @expression.left = process_expression_item(item[0])
            @expression.right = process_expression_item(item[1])
          end
        end
      end

      def process_expression_item(item)
        case item.to_s
          when 'FIELD_ACCESSOR'
            FieldAccessorInterpreter.new(item).field
        end
      end

    end

    class FieldAccessorInterpreter

      attr_accessor :field

      def initialize(tree)
        process_field(tree)
      end

      def process_field(item)
        @field = Yarpler::Datastructure::Field.new
        @field.variable = item[0].to_s
        @field.attribute = item[1].to_s
      end
    end
  end
end
