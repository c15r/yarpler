module Yarpler
  module Interpreters
    class SetInterpreter
      attr_accessor :set

      def initialize(item, objects)
        @set = []
        process_set(item, objects)
      end

      def process_set(tree, objects)
        # @TODO Error handling
        tree.each do |thing|
          set.push(objects[thing.to_s])
        end
        set
      end
    end
  end
end