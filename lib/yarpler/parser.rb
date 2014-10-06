module Yarpler
  class Parser
    def initialize(yarpl)
      @yarpl = yarpl
      parse
    end

    attr_reader :tree

    private

    def parse
      out = StringIO.new
      err = StringIO.new
      $stdout = out
      $stderr = err

      lexer = Yarpl::Lexer.new(@yarpl)
      tokens = ANTLR3::CommonTokenStream.new(lexer)  # Ein Array
      parser = Yarpl::Parser.new(tokens)
      returnValue = parser.start

      $stdout = STDOUT
      $stderr = STDERR

      if !err.string.empty?
        Yarpler::Log.instance.error 'Syntax error in YARPL input file.'
        Yarpler::Log.instance.error err.string
        Yarpler::Log.instance.error print_input_tree(returnValue.tree)
        abort
      else
        @tree = returnValue.tree
      end
    end

    def print_input_tree(tree, depth = 0)
      indent = ''
      for i in 0..depth
        indent += '    '
      end

      val = indent + tree.to_s + "\n"
      tree.each do |thing|
        val << print_input_tree(thing, 1 + depth)
      end
      val
    end
  end
end
