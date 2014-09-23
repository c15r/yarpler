module Yarpler
  module Datastructure
    class Ressource

      def initialize(new_name)
        set_name(new_name)
      end

      def set_name(new_name)
        @name = new_name
      end

      def name
        @name
      end

      def add_entity

      end

      def remove_entity

      end

      def print
        puts @name
      end

    end
  end
end
