module Yarpler
  module Interpreters
    # NotInterpreter processes a YARPL not expression
    #
    # @attr_reader not [Yarpler::Models::Not] interpreted not expression
    #
    # == YARPL Example
    #
    #   not(d1 in m1.dienste)
    #
    class NotInterpreter
      attr_reader :not

      # Initializes the interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def initialize(tree)
        @not = Yarpler::Models::Not.new
        process_not(tree)
      end

      private

      # Processes a not expression
      #
      # @param expression [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [Yarpler::Models::Not] interpreted not expression
      def process_not(expression)
        @not.expression = Yarpler::Interpreters::ExpressionInterpreter.new(expression).expression
      end
    end
  end
end
