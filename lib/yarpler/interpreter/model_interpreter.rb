module Yarpler
  module Interpreter
    class ModelInterpreter

      def initialize(tree)
        tree_converter(tree)
      end

      def tree_converter(tree)
        tree.each do |thing|
          case thing.to_s
            when 'CLASS_DECLARATION'
              ClassInterpreter.new(thing)
          end
        end
      end
    end
  end
end