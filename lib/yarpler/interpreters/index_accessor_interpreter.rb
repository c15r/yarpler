module Yarpler
  module Interpreters
    class IndexAccessorInterpreter
      attr_accessor :index

      def initialize(item)
        process_index(item)
      end

      def process_index(item)
        # @TODO Index auch für Tiefe verschachtelungen erweitern
        process_single(item)
      end

      def process_single(item)
        @index = Yarpler::Models::Index.new
        @index.index = item[0].to_s
        @index.variable = item[1].to_s
        @index.attribute = item[2].to_s
      end
    end
  end
end
