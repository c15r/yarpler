module Yarpler
  module Interpreter
    class ExpressionInterpreter

      def initialize(tree)
        @expression = tree[0].to_s
        puts "**************"
        puts "EXPRESSION " + tree[0].to_s
        puts "**************"
      end

    end
  end
end
