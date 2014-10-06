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
      problem = interpret(tree)

      # minizinc_code = translate_to_minizinc(problem)
      # puts minizinc_code
      # minizinc_runner = Yarpler::Utils::MinizincRunner.new
      # minizinc_runner.run(minizinc_code)

      # output_parser = Yarpler::OutputParser.new(minizinc_runner.output, problem)
      # output_parser.problem
    end

    private

    def parse(filename)
      file = Yarpler::Utils::FileLoader.new(filename)
      parser = Yarpler::Parser.new(file.get_content)
      parser.tree
    end

    def interpret(tree)
      interpreter = Yarpler::Interpreter::YARPLInterpreter.new(tree)
      interpreter.problem
    end
  end
end
