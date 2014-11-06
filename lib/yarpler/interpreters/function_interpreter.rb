module Yarpler
  module Interpreters
    # FunctionInterpreter is responsible for interpreting YARPL functions
    # like count(), sum()
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
        if function.size == 2
          process_count_function_element(function)
        elsif function.size == 1
          process_card_function(function)
        end
      end

      def process_card_function(function)
        count = Yarpler::Models::Cardinality.new
        count.element = Yarpler::Interpreters::FieldAccessorInterpreter.new(function[0]).field
        count
      end

      def process_count_function_element(function)
        count = Yarpler::Models::CountFunction.new

        count.element = Yarpler::Interpreters::InstanceInterpreter.new(function[0]).instance
        count.range = Yarpler::Interpreters::FieldAccessorInterpreter.new(function[1]).field
        count
      end

      def process_sum_value_function(function)
        # TODO: Erlaube verschachtelungen ueber mehr als drei Ebenen, oder auch nur ueber zwei?
        function = function[0]
        sum = Yarpler::Models::SumValueFunction.new
        sum.set = Yarpler::Models::Field.new
        sum.set.variable = function[0].to_s
        sum.set.attribute = function[1].to_s
        sum.attribute = function[2].to_s
        sum.elements = resolve_elements(function, sum)
        sum
      end

      def resolve_elements(function, sum)
        # obj can not be found yet for objects in a allquantor with substitute identifier
        obj = Yarpler::Models::Problem.instance.objects[function[0].to_s]
        if obj.nil?
          sum.set
        else
          obj.get_value(function[1].to_s)
        end
      end

      def process_sum_function(function)
        if function[0].size == 1 && function[0][0].size == 1
          sum = process_sum_value_function(function[0][0])
        else
          sum = Yarpler::Models::SumFunction.new
          function[0].each do |expression|
            sum.elements.push(Yarpler::Interpreters::ExpressionInterpreter.new(expression).expression)
          end
        end
        sum
      end
    end
  end
end
