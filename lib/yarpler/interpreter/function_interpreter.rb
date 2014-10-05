module Yarpler
  module Interpreter
    class FunctionInterpreter

      def function
        @function
      end

      def initialize(tree)
        @function = ''
        process_function(tree)
      end

      private

      def process_function(function)
        case function[0].to_s
          when 'COUNT_IN'
            @function = process_count_function(function[0])
          when 'SUM'
            @function = process_sum_function(function[0])
        end
      end

      def process_count_function(function)
        count = Yarpler::Models::CountFunction.new

        count.element = Yarpler::Interpreter::InstanceInterpreter.new(function[0]).instance

        # TODO: hier können potentiell verschiedene Ranges angegeben werden
        #       es bräuchte also noch eine Fallunterscheidung...
        count.range = Yarpler::Interpreter::FieldAccessorInterpreter.new(function[1]).field

        count
      end

      def process_sum_function(function)
        sum = Yarpler::Models::SumFunction.new

        function[0].each do |expression|
          sum.elements.push(Yarpler::Interpreter::ExpressionInterpreter.new(expression).expression)
        end

        sum
      end
    end
  end
end