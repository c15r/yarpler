module Yarpler
  module Interpreter
    class ConstraintInterpreter

      def initialize(tree)
        @expression = tree[0].to_s
        puts "**************"
        puts "CONSTRAINT " + tree[0].to_s
        puts "**************"
        parse_expression(tree)
      end

      private

      def parse_expression(expressions)
        expressions.each do |expression|
          ExpressionInterpreter.new(expression)
        end
      end

    end
  end
end
