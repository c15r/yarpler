module Yarpler
  module Extensions
    class Translator
      def initialize
        @output = ''
      end

      attr_reader :output

      ##
      # Processes the model and returns it
      def before_translate(_problem)
        fail NotImplementedError
      end

      ##
      # Translates the model to another language
      def translate(_problem)
        fail NotImplementedError
      end

      ##
      # Processes the model and returns it
      def after_translate(_problem)
        fail NotImplementedError
      end
    end
  end
end
