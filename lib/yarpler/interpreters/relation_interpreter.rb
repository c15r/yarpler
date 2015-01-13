module Yarpler
  module Interpreters
    # RelationInterpreter processes a YARPL relation declaration
    # This language concept is used to express relations between objects
    #
    # @attr_reader relation [Yarpler::Models::Relation] interpreted relation
    #
    # == YARPL Example
    #
    #   # Relation between a employee and a work day
    #   relation(employee1Day1.day, day1);
    #
    class RelationInterpreter
      attr_reader :relation

      # Initializes the interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @param objects [Hash<String, Object>] hash map of all yarpl objects
      # @return [void]
      def initialize(tree, objects)
        @relation = Yarpler::Models::Relation.new
        parse_relation(tree, objects)
      end

      private

      # Parses the rleation
      #
      # @param relation [ANTLR3::AST::CommonTree] ANTLR tree node
      # @param objects [Hash<String, Object>] hash map of all yarpl objects
      # @return [Yarpler::Models::Relation] interpreted relation
      def parse_relation(relation, objects)
        # TODO: Error Handling if const and SET and other wrong inputs
        @relation.from = FieldAccessorInterpreter.new(relation[0]).field
        @relation.type = objects[@relation.from.variable.to_s].get_variabletype(@relation.from.attribute.to_s)
        @relation.to = SetInterpreter.new(relation[1], objects).set
      end
    end
  end
end
