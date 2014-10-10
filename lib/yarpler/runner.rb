module Yarpler
  class Runner
    ##
    # Loads the AST
    #
    def tree(filename)
      parse(filename)
    end

    ##
    # Loads the data structure from the AST
    #
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
