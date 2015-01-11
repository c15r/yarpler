module Yarpler
  module Interpreters
    # InstanceInterpreter processes a YARPL variable which references a class instance
    class InstanceInterpreter
      attr_accessor :instance

      # Initializes the instance
      def initialize(item)
        process_instance(item)
      end

      # Processes the single instance
      def process_instance(item)
        @instance = Yarpler::Models::Instance.new
        @instance.variable = item[0].to_s
      end
    end
  end
end
