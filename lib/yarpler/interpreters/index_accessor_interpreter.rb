module Yarpler
  module Interpreters
    # IndexAccessorInterpreter processes a YARPL statement which accesses a object in a list
    #
    # @attr_reader index [Yarpler::Models::Index] interpreted index
    #
    # == YARPL Example
    #
    #   mt[1].dienst != d1
    #
    class IndexAccessorInterpreter
      attr_accessor :index

      # Initializes the interpreter
      #
      # @param item [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def initialize(item)
        process_index(item)
      end

      # Processes the index
      #
      # @param item [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [Yarpler::Models::Index] interpreted index object
      def process_index(item)
        # TODO: Index auch fuer Tiefe verschachtelungen erweitern
        process_single(item)
      end

      # Processes a single item
      #
      # @param item [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [Yarpler::Models::Index] interpreted index object
      def process_single(item)
        @index = Yarpler::Models::Index.new
        @index.index = item[0].to_s
        @index.variable = item[1].to_s
        @index.attribute = item[2].to_s
      end
    end
  end
end
