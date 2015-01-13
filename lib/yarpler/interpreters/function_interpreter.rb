module Yarpler
  module Interpreters
    # FunctionInterpreter is responsible for interpreting YARPL functions
    # like count(), sum()
    #
    # @attr_reader function [Yarpler::Models::Function] interpreted function
    class FunctionInterpreter
      attr_reader :function

      # Initializes the interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @param objects [Hash<String, Object>] hash map of all yarpl objects
      # @return [void]
      def initialize(tree, objects=nil)
        @function = ''
        @objects = objects
        process_function(tree)
      end

      private

      # Processes a function
      #
      # @param function [ANTLR3::AST::CommonTree] function expression parsed by antlr
      # @return [void]
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

      # Processes the count function
      #
      # @param function [ANTLR3::AST::CommonTree] function expression parsed by antlr
      # @return [Yarpler::Models::Function] interpreted function
      def process_count_function(function)
        if function.size == 2
          process_count_function_element(function)
        elsif function.size == 1
          process_card_function(function)
        end
      end

      # Processes the card function
      #
      # @param function [ANTLR3::AST::CommonTree] function expression parsed by antlr
      # @return [Yarpler::Models::CountFunction] interpreted function
      def process_card_function(function)
        count = Yarpler::Models::Cardinality.new
        count.element = Yarpler::Interpreters::FieldAccessorInterpreter.new(function[0][1]).field
        count
      end

      # Processes an element of the count function
      #
      # @param function [ANTLR3::AST::CommonTree] function expression parsed by antlr
      # @return [Yarpler::Models::Function] interpreted function
      def process_count_function_element(function)
        count = Yarpler::Models::CountFunction.new

        count.where = ExpressionInterpreter.new(function[1]).expression
        if count.where.operator.to_s != '==' or !(count.where.left.is_a? Yarpler::Models::Instance or count.where.left.is_a? Yarpler::Models::Field) or !(count.where.right.is_a? Yarpler::Models::Instance or !count.where.right.is_a? Yarpler::Models::Field)
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
        # count.inner =
        count
      end

      # Processes the sum value function
      #
      # @param function [ANTLR3::AST::CommonTree] function expression parsed by antlr
      # @return [Yarpler::Models::Function] interpreted function
      def process_sum_value_function(function)
        sum = Yarpler::Models::SumValueFunction.new
        sum.set = FieldAccessorInterpreter.new(function[0][1]).field
        field = FieldAccessorInterpreter.new(function[1]).field
        sum.attribute = field.attribute
        sum.elements = sum.set
        sum
      end

      # Processes the countall function
      #
      # @param function [ANTLR3::AST::CommonTree] function expression parsed by antlr
      # @return [Yarpler::Models::Function] interpreted function
      def process_countall_function(function)
        interpreter = CountallInterpreter.new(function, @objects)
        interpreter.countAll
      end
    end
  end
end
