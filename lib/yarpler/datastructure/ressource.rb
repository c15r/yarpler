module Yarpler
  module Datastructure
    class Ressource

      def print
        puts "####################"
        puts "Ressource:"
        puts self.class
        puts ""
        puts "Methods:"
        puts self.methods - Object.methods - [:print]
        puts "####################"
        puts ""
      end

    end
  end
end
