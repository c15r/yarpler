module Yarpler
  module Datastructure
    class Ressource

      FIXNUM_MAX = (2**(0.size * 8 -2) -1)
      FIXNUM_MIN = -(2**(0.size * 8 -2))

      def initialize
        @id=Yarpler::RessourceHandler.instance.next_id(self)
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

      def load(attribute)
        val = get_value(attribute)
        if val.kind_of?(Array)
          val = array_to_range(val)
        end
        val
      end

      # @TODO: Kann falsch sein! Was passiert z.B. wenn hier nicht ein komplettes Set vorhanden ist? z.B. 0, 1, 3, 5? Resulat aktuell wäre 0..5 was falsch ist, muss gehandelt werden
      def array_to_range(array)
        min = FIXNUM_MAX
        max = FIXNUM_MIN
        array.each do |o|
          if (min > o.id)
            min = o.id
          end

          if (max < o.id)
            max = o.id
          end
        end
        range=min.to_s+".."+max.to_s
        range
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
