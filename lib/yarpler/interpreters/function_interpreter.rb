module Yarpler
  module Interpreters
    # FunctionInterpreter is responsible for interpreting YARPL functions
    # like count(), sum()
    class FunctionInterpreter
      attr_reader :function

      def initialize(tree, objects=nil)
        @function = ''
        @objects = objects
        process_function(tree)
      end

      private

      def process_function(function)
        case function[0].to_s
          when 'COUNT_IN'
            @function = process_count_function(function[0])
          when 'SUM'
            @function = process_sum_value_function(function[0])
          when 'COUNTALL'
            @function = process_countall_function(function[0])
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
        count.element = Yarpler::Interpreters::FieldAccessorInterpreter.new(function[0][1]).field
        count
      end

      def process_count_function_element(function)
        count = Yarpler::Models::CountFunction.new

        count.where = ExpressionInterpreter.new(function[1]).expression
        if count.where.operator.to_s != '==' or !count.where.left.is_a? Yarpler::Models::Instance or !count.where.right.is_a? Yarpler::Models::Instance
          fail Yarpler::Exceptions::InvalidCountExpression
        end

        if count.where.left.variable == function[0][0].to_s
          count.element = count.where.right
        elsif count.where.right.variable == function[0][0].to_s
          count.element = count.where.left
        else
          fail Yarpler::Exceptions::InvalidCountExpressionNoSubstitution
        end
        count.range = Yarpler::Interpreters::FieldAccessorInterpreter.new(function[0][1]).field
        count
      end

      def process_sum_value_function(function)
        sum = Yarpler::Models::SumValueFunction.new
        sum.set = FieldAccessorInterpreter.new(function[0][1]).field
        field = FieldAccessorInterpreter.new(function[1]).field
        sum.attribute = field.attribute
        sum.elements = sum.set
        sum
      end

      def process_countall_function(function)
        interpreter = CountallInterpreter.new(function, @objects)
        interpreter.countAll
      end
    end
  end
end
