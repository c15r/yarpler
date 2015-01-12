module Yarpler
  module Extensions
    # Superclass for translator extensions of the YARPLER pipeline.
    # Inherited classes can be used to to convert the datastructure into another language.
    # (for example see MinizincTranslator)
    #
    # @abstract
    # @attr_reader output [String] output of a translation process
    class Translator
      attr_reader :output

      def initialize
        @output = ''
      end

      # Processes the model and returns it
      #
      # @param _problem [Problem] internal representation of the yarpl problem
      # @return [Problem] processed problem object
      def before_translate(_problem)
        fail NotImplementedError
      end

      # Translates the model to another language
      #
      # @param _problem [Problem] internal representation of the yarpl problem
      # @return [Problem] processed problem object
      def translate(_problem)
        fail NotImplementedError
      end

      # Processes the model and returns it
      #
      # @param _problem [Problem] internal representation of the yarpl problem
      # @return [Problem] processed problem object
      def after_translate(_problem)
        fail NotImplementedError
      end
    end
  end
end
