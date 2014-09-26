module Yarpler
  module Interpreter
    class YARPLInterpreter

      attr_accessor :problem

      def initialize(tree)
        @problem = Yarpler::Datastructure::Problem.new
        tree_converter(tree)
      end

      private

      def tree_converter(tree)

        # @TODO evtl noch etwas schöner mit ENUM?
        case tree.to_s
          when 'CLASS_DECLARATION'
            ClassInterpreter.new(tree)
          when 'INITIAL_DECLARATION'
            initial = InitialInterpreter.new(tree)
            @problem.objects = initial.objects
            @problem.constraints = initial.constraints
        end

        tree.each do |thing|
          tree_converter(thing)
        end
      end

    end
  end
end
