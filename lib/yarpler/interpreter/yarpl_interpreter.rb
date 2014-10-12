module Yarpler
  module Interpreter
    class YARPLInterpreter
      def initialize(tree)
        tree_converter(tree)
      end

      private

      def tree_converter(tree)
        tree.each do |thing|
          case thing.to_s
            when 'MODEL_DECLARATION'
              ModelInterpreter.new(thing)
            when 'INITIAL_DECLARATION'
              initial = InitialInterpreter.new(thing)
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
end
