module Yarpler
  module Exceptions
    class YarplerException < StandardError
      attr_reader :message

      def initialize()
        @message = 'Unknown Exception'
      end

    end

    class ClassNotInModelException < YarplerException
      def initialize(name)
        @message = "The class [%s] has not been defined in the model." % [name]
      end
    end

    class SyntaxErrorException < YarplerException
      def initialize(addidional)
        @message = 'Syntax error in YARPL input file at ' + addidional
      end
    end

    class UninitializedConstantException < YarplerException
      def initialize(instance, attribute)
        @message = "The constant [%s.%s] has not been initialized." % [instance,attribute]
      end
    end

    end
end