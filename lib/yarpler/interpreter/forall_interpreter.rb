module Yarpler
  module Interpreter
    class ForallInterpreter
      attr_reader :forall

      def initialize(tree)
        @forall = Yarpler::Models::Forall.new
        process_forall(tree)
      end

      private

      def process_forall(expression)
      end
    end
  end
end
