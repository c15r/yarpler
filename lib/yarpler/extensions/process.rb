module Yarpler
  # Extension module
  module Extensions
    # Superclass for process extensions of the YARPLER pipeline.
    # Inherited classes can be used to modify the datastructure of the parse tree.
    class Process
      ##
      # Processes the model and returns it
      def process(_problem)
        fail NotImplementedError
      end
    end
  end
end
