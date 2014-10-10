module Yarpler
  # Runner is the interface to YARPLER
  class Runner
    # Loads the AST
    def tree(filename)
      parse(filename)
    end

    # Interprets the AST and creates a YARPL data structure out of it
    #
    # @param tree [ANTR3::AST::CommonTree] the complete AST
    def load(tree)
      interpret(tree)
    end

    def run(filename)
      tree = parse(filename)
      interpret(tree)
    end

    private

    def parse(filename)
      file = Yarpler::Utils::FileLoader.new(filename)
      parser = Yarpler::Parser.new(file.content)
      parser.tree
    end

    def interpret(tree)
      interpreter = Yarpler::Interpreter::YARPLInterpreter.new(tree)
      interpreter.problem
    end
  end
end
