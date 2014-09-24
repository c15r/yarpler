module Yarpler
  module Datastructure
    class Ressource

      def initialize
        @id=Yarpler::RessourceHandler.instance.next_id
      end

      def id
        @id
      end

      def id_datatype
        "int"
      end

      def id_variabletype
        "CONSTANT"
      end

      def print
        puts "####################"
        puts "Ressource:"
        puts self.class
        puts ""
        puts "Methods:"
        puts self.methods - Object.methods - [:print, :get_value, :set_value, :initialize]
        puts "####################"
        puts ""
      end

      def get_value(attribute)
        self.send(attribute)
      end

      def set_value(attribute, value)
        self.send(attribute+"=",value)
      end

      def get_list_of_attributes
        list = Array.new
        self.instance_variables.each do |i|
          list.push(i.to_s.sub! '@', '')
        end
        list
      end

      def get_datatype(attribute)
        self.send(attribute+"_datatype")
      end

      def get_variabletype(attribute)
        self.send(attribute+"_variabletype")
      end

    end
  end
end
