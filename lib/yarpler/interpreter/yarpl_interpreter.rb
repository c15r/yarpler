module Yarpler
  module Interpreter
    class YARPLInterpreter

      def initialize(tree)
        tree_converter(tree)
      end

      private

      def tree_converter(tree)

        # @TODO evtl noch etwas schöner mit ENUM?
        case tree.to_s
          when "CLASS_DECLARATION"
            ClassInterpreter.new(tree)
        end

        tree.each do |thing|
          tree_converter(thing)
        end
      end

    end
  end
end
