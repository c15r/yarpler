module Yarpler
  # Core is the interface to YARPLER
  class Core

    # features which yarpler should provide:
    # - method to solve a problem
    # - what else???

    def initialize

    end

    def solve_problem(yarpl_problem)
      Yarpler::Log.instance.info 'Starting to solve the problem'

      solution = Solution.new
      solution.ast = parse_problem_with_antlr(yarpl_problem)
      solution.data = interpret_ast(solution.ast)
    end

    def solve_from_file(filename)
      Yarpler::Log.instance.info "Extracting the problem from file #{filename}"

      problem = read_file(filename)
      solve_problem(problem)
    end

    private

    def read_file(filename)
      loader = Yarpler::Utils::FileLoader.new
      loader.load_files(filename)
    end

    def parse_problem_with_antlr(problem)
      antlr_parser = Yarpler::Parser.new
      antlr_parser.parse(problem)
    end

    def interpret_ast(antlr_ast)
      interpreter = Yarpler::Interpreter.new
      interpreter.interpret(antlr_ast)
    end

    def translate_problem(problem)

    end
  end
end
