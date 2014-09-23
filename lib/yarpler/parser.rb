#require 'yarpl/YarplLexer'
#require 'yarpl/YarplParser'

module Yarpler
  class Parser

    def initialize(yarpl)
      @yarpl = yarpl
      parse
    end

    def print
      tree_printer(@tree)
    end

    def tree
      @tree
    end

    private

    def parse
      lexer = Yarpl::Lexer.new(@yarpl)
      tokens = ANTLR3::CommonTokenStream.new(lexer)  #Ein Array
      parser = Yarpl::Parser.new(tokens)
      returnValue = parser.start()
      @tree = returnValue.tree()
    end

    def tree_printer(tree, depth=0)
      indent = ''
      for i in 0..depth
        indent += "    "
      end

      puts indent+tree.to_s
      tree.each do |thing|
        tree_printer(thing, 1 + depth)
      end

    end
  end
end