module Yarpler
  class Runner

    ##
    # Displays the AST
    #
    def tree(filename)
      parse(filename)
    end

    ##
    # Translate a file to MiniZinc and displays it
    #
    def translate(filename)
      tree = parse(filename)
      problem = interpret(tree)
      translate_to_minizinc(problem)
    end

    ##
    # Converts a file to MiniZinc and solves it
    #
    def solve(filename)
      tree = parse(filename)
      problem = interpret(tree)

      minizinc_code = translate_to_minizinc(problem)
      puts minizinc_code
      minizinc_runner = Yarpler::Utils::MinizincRunner.new
      minizinc_runner.run(minizinc_code)

      output_parser = Yarpler::OutputParser.new(minizinc_runner.output, problem)
      output_parser.problem
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

    def translate_to_minizinc(problem)
      minizinc_translator = Yarpler::Translators::MinizincTranslator.new
      minizinc_translator.translate(problem)
      minizinc_translator.output
    end
  end
end