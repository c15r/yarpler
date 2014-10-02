module Yarpler
  module Translators
    class Translator

      def initialize
        @output = ''
      end

      def output
        @output
      end

      def translate(problem)
        raise NotImplementedError
      end
    end
  end
end