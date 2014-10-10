module Yarpler
  module Interpreter
    class InstanceInterpreter
      attr_accessor :instance

      def initialize(item)
        process_instance(item)
      end

      def process_instance(item)
        @instance = Yarpler::Models::Instance.new
        @instance.variable = item[0].to_s
      end
    end
  end
end