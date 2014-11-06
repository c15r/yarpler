module Yarpler
  module Exceptions
    # Main YARPLER Exception
    # Derive all specific exceptions from this one
    class YarplerException < StandardError
      attr_reader :message

      def initialize
        @message = 'Unknown Exception'
      end
    end

    # Indicates that a class could not be found
    class ClassNotInModelException < YarplerException
      def initialize(name)
        @message = "The class #{name} has not been defined in the model."
      end
    end

    # Indicates that there was a syntax error in a YARPL file
    class SyntaxErrorException < YarplerException
      def initialize(additional)
        @message = "Syntax error in YARPL input file at #{additional}"
      end
    end

    # Indicates that there was a constant used without initialization
    class UninitializedConstantException < YarplerException
      def initialize(instance, attribute)
        @message = "The constant [#{instance}.#{attribute}] has not been initialized."
      end
    end

    # Indicates that there is an invalid where exception
    class InvalidWhereExpression < YarplerException
      def initialize()
        @message = "The where-Expression is invalid. You tried to use a feature that was not implemented yet."
      end
    end
  end
end
