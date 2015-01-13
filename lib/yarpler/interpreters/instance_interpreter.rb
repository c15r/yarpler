module Yarpler
  module Interpreters
    # InstanceInterpreter processes a YARPL variable which references a class instance
    #
    # @attr_reader instance [Yarpler::Models::Instance] interpreted instance
    class InstanceInterpreter
      attr_accessor :instance

      # Initializes the instance
      #
      # @param item [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def initialize(item)
        process_instance(item)
      end

      # Processes the single instance
      #
      # @param item [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [Yarpler::Models::Instance] interpreted instance
      def process_instance(item)
        @instance = Yarpler::Models::Instance.new
        @instance.variable = item[0].to_s
      end
    end
  end
end
