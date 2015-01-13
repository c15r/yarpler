module Yarpler
  module Models
    ##
    # Model for a Relation between multiple objects
    class Relation
      attr_accessor :from
      attr_accessor :to
      attr_accessor :type

      # Initializes the model object
      #
      # @return [void]
      def initialize
      end

      # Clones the object
      #
      # @return [Yarpler::Models::Relation]
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
