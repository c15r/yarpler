module Yarpler
  module Interpreter
    class YARPLInterpreter

      def problem
        @problem
      end

      def problem=(new_problem)
        @problem = new_problem
      end

      def initialize(tree)
        tree_converter(tree)
      end

      private

      def tree_converter(tree)

        tree.each do |thing|
          # @TODO evtl noch etwas schöner mit ENUM?
          case thing.to_s
            when "DOMAIN_DECLARATION"
              DomainInterpreter.new(thing)
            when "INITIAL_DECLARATION"
              self.problem=InitialInterpreter.new(thing).problem
          end
        end

        #
        #  tree_converter(thing)
        #end
      end

    end
  end
end
