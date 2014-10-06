module Yarpler
  module Extensions
    class Process
      ##
      # Processes the model and returns it
      def process(_problem)
        fail NotImplementedError
      end
    end
  end
end
