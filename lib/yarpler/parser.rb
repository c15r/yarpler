module Yarpler
  # The Yarpler Parser abstracts the auto generated ANTLR3 Lexer/Parser
  # Responsible for parsing a YARPL problem specification and generating an AST
  class Parser
    def initialize
    end

    def parse(yarpl_problem)
      out, err = StringIO.new, StringIO.new
      previous_stderr, $stderr = $stderr, err
      previous_stdout, $stdout = $stdout, out

      tree = process_problem(yarpl_problem)
      error?(err)
      tree
    ensure
      $stderr = previous_stderr
      $stdout = previous_stdout
    end

    private

    def error?(error)
      fail Yarpler::Exceptions::SyntaxErrorException, error.string unless error.string.empty?
    end

    def process_problem(yarpl_problem)
      lexer = Yarpl::Lexer.new(yarpl_problem)
      tokens = ANTLR3::CommonTokenStream.new(lexer)  # Ein Array
      parser = Yarpl::Parser.new(tokens)
      antlr_result = parser.start
      antlr_result.tree
    end
  end
end
