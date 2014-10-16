module Yarpler
  module Interpreter
    class FunctionInterpreter
      attr_reader :function

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

      def process_sum_value_function(function)
        function=function[0]
        # @TODO Erlaube verschachtelungen über mehr als drei Ebenen, oder auch nur über zwei?
        sum = Yarpler::Models::SumValueFunction.new
        obj=Yarpler::Models::Problem.instance.objects[function[0].to_s]
        sum.set=Yarpler::Models::Field.new
        sum.set.variable=function[0].to_s
        sum.set.attribute=function[1].to_s
        sum.elements=obj.get_value(function[1].to_s)
        sum.attribute=function[2].to_s
        sum
      end

      def process_sum_function(function)
        if (function[0].size==1 && function[0][0].size==1)
          sum=process_sum_value_function(function[0][0])
        else
          sum = Yarpler::Models::SumFunction.new
          function[0].each do |expression|
            sum.elements.push(Yarpler::Interpreter::ExpressionInterpreter.new(expression).expression)
          end
        end



        sum
      end
    end
  end
end
