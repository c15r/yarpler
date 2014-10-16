module Yarpler
  class Interpreter
    def initialize

    end

    def interpret(antlr_ast)
      antlr_ast.each do |thing|
        case thing.to_s
          when 'MODEL_DECLARATION'
            Yarpler::Interpreters::ModelInterpreter.new(thing)
          when 'INITIAL_DECLARATION'
            initial = Yarpler::Interpreters::InitialInterpreter.new(thing)
            Yarpler::Models::Problem.instance.objects = initial.objects
          when 'SOLVE_DECLARATION'
            solve_interpreter = SolveInterpreter.new(thing, Yarpler::Models::Problem.instance.objects)
            Yarpler::Models::Problem.instance.solve = solve_interpreter.solve
            Yarpler::Models::Problem.instance.constraints = solve_interpreter.constraints
        end
      end
    end
  end
end
