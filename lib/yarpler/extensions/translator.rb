module Yarpler
  module Extensions
    ##
    # Superclass for translator extensions of the YARPLER pipeline. Inherited classes can be used to to convert the datastructure into another language. (for example see MinizincTranslator)
    class Translator
      attr_reader :output

      def initialize
        @output = ''
      end

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
