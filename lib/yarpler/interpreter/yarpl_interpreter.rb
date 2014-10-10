module Yarpler
  module Interpreter
    class YARPLInterpreter
      attr_accessor :problem

      def initialize(tree)
        @problem = Yarpler::Models::Problem.new
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
              @problem.objects = initial.objects
            when 'SOLVE_DECLARATION'
              solve_interpreter = SolveInterpreter.new(thing)
              @problem.solve = solve_interpreter.solve
              @problem.constraints = solve_interpreter.constraints
          end
        end
      end
    end
  end
end
