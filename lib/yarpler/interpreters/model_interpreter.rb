module Yarpler
  module Interpreters
    # ModelInterpreter processes a YARPL model block declaration
    # The model part of YARPL is used to declare a model with classes
    #
    # == YARPL Example
    #
    #   model { ... }
    #
    class ModelInterpreter

      # Initializes the interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def initialize(tree)
        tree_converter(tree)
      end

      # Converts the tree
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def tree_converter(tree)
        tree.each do |thing|
          case thing.to_s
            when 'CLASS_DECLARATION'
              ClassInterpreter.new(thing)
          end
        end
      end
    end
  end
end
