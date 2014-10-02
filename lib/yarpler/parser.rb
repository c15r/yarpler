module Yarpler
  class Parser

    def initialize(yarpl)
      @yarpl = yarpl
      parse
    end

    def tree
      @tree
    end

    private

    def parse
      Yarpler::Log.instance.info "Start parsing the input file."

      out = StringIO.new
      err = StringIO.new
      $stdout = out
      $stderr = err

      lexer = Yarpl::Lexer.new(@yarpl)
      tokens = ANTLR3::CommonTokenStream.new(lexer)  #Ein Array
      parser = Yarpl::Parser.new(tokens)
      returnValue = parser.start()

      $stdout = STDOUT
      $stderr = STDERR

      if not err.string.empty?
        Yarpler::Log.instance.error "Syntax error in YARPL input file."
        Yarpler::Log.instance.error err.string
        abort
      else
        @tree = returnValue.tree()
      end

    end

  end
end