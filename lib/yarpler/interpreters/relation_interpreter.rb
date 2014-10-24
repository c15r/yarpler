module Yarpler
  module Interpreters
    class RelationInterpreter
      attr_reader :relation

      def initialize(tree, objects)
        @relation = Yarpler::Models::Relation.new
        parse_relation(tree, objects)
      end

      private

      def parse_relation(relation, objects)
        # TODO: Error Handling if const and SET and other wrong inputs
        @relation.from = FieldAccessorInterpreter.new(relation[0]).field
        @relation.type = objects[@relation.from.variable.to_s].get_variabletype(@relation.from.attribute.to_s)
        @relation.to = SetInterpreter.new(relation[1], objects).set
      end
    end
  end
end