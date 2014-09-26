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
        tree.each do |thing|
          case thing.to_s
            when 'DOMAIN_DECLARATION'
              DomainInterpreter.new(thing)
            when 'INITIAL_DECLARATION'
              initial = InitialInterpreter.new(thing)
              @problem.objects = initial.objects
              @problem.constraints = initial.constraints
          end
        end
      end

    end
  end
end
