module Yarpler
  module Models
    class Relation
      attr_accessor :from
      attr_accessor :to
      attr_accessor :type

      def initialize
      end

      def clone
        new = Relation.new
        new.from = @from.clone
        new.to = @to.clone
        new.type = @type.clone
        new
      end
    end
  end
end
