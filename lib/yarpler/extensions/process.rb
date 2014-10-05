module Yarpler
  module Extensions
    class Process

      ##
      # Processes the model and returns it
      def process(problem)
        raise NotImplementedError
      end
    end
  end
end