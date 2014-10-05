module Yarpler
  module Extensions
    class Translator

      def initialize
        @output = ''
      end

      def output
        @output
      end

      ##
      # Processes the model and returns it
      def before_translate(problem)
        raise NotImplementedError
      end

      ##
      # Translates the model to another language
      def translate(problem)
      raise NotImplementedError
      end

      ##
      # Processes the model and returns it
      def after_translate(problem)
        raise NotImplementedError
      end
    end
  end
end