module Yarpler
  module Models
    ##
    # Model for an index selector in a forall clause
    class Index
      attr_accessor :variable
      attr_accessor :index
      attr_accessor :attribute

      def initialize
      end

      def clone
        new = Index.new
        new.variable = @variable.clone
        new.attribute = @attribute.clone
        new.index = @index.clone
        new
      end
    end
  end
end
