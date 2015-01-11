module Yarpler
  module Interpreters
    # SetInterpreter processes a YARPL Set and pushes the values to an internal data structure
    #
    # == YARPL Example
    #
    #   {d1,d2,f}
    #
    class SetInterpreter
      attr_accessor :set

      # Initializes the interpreter
      def initialize(item, objects=nil)
        @set = []
        if objects.nil?
          process_integer_set(item)
        else
          process_set(item, objects)
        end
      end

      private

      # Processes a set of integers
      def process_integer_set(tree)
        # @TODO Error handling
        tree.each do |thing|
          set.push(thing.to_s)
        end
        set
      end

      # Processes a set of objects
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
