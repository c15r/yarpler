module Yarpler
  module Datastructure
    class Ressource

      def print
        puts "####################"
        puts "Ressource:"
        puts self.class
        puts ""
        puts "Methods:"
        puts self.methods - Object.methods - [:print, :get_value, :set_value]
        puts "####################"
        puts ""
      end

      def get_value(attribute)
        self.send(attribute)
      end

      def set_value(attribute, value)
        self.send(attribute+"=",value)
      end

    end
  end
end
