module Yarpler
  class Parser
    def initialize

    end

    def parse(yarpl_problem)
      out = StringIO.new
      err = StringIO.new
      $stdout = out
      $stderr = err

      lexer = Yarpl::Lexer.new(yarpl_problem)
      tokens = ANTLR3::CommonTokenStream.new(lexer)  # Ein Array
      parser = Yarpl::Parser.new(tokens)
      antlr_result = parser.start
      tree = antlr_result.tree

      $stdout = STDOUT
      $stderr = STDERR

      if !err.string.empty?
        Yarpler::Log.instance.error 'Syntax error in YARPL input file.'
        Yarpler::Log.instance.error err.string
        Yarpler::Log.instance.error print_input_tree(tree)
        abort
      else
        tree
      end
    end

    private

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
