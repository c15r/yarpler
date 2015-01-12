module Yarpler
  # Interpreter module with all the classes to analyze the
  # YARPL input
  module Interpreters
    # AbsoluteInterpreter processes a YARPL absolute expression
    #
    # @attr_reader absolute [Yarpler::Models::Absolute] interpreted absolute model object
    #
    # == YARPL Example
    #
    #   abs(m1.differenz)
    #
    class AbsoluteInterpreter
      attr_reader :absolute

      # Inizializes the interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def initialize(tree)
        @absolute = Yarpler::Models::Absolute.new
        process_absolute(tree)
      end

      private

      # Processes an absolute function
      #
      # @param expression [ANTLR3::AST::CommonTree] parsed expression of the absolute function
      # @return [void]
      def process_absolute(expression)
        case expression[0].to_s
          when 'FIELD_ACCESSOR'
            @absolute.expression = Yarpler::Interpreters::FieldAccessorInterpreter.new(expression[0]).field
          when 'EXPRESSION'
            @absolute.expression = Yarpler::Interpreters::ExpressionInterpreter.new(expression[0]).expression
        end
      end
    end
  end
end
