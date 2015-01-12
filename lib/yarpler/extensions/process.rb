module Yarpler
  # Extension module
  module Extensions
    # Superclass for process extensions of the YARPLER pipeline.
    # Inherited classes can be used to modify the datastructure of the parse tree.
    #
    # @abstract
    class Process
      # Processes the model and returns it
      #
      # @param _problem [Problem] internal representation of the yarpl problem
      # @return [Problem] processed problem object
      def process(_problem)
        fail NotImplementedError
      end
    end
  end
end
