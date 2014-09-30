module Yarpler
  module Datastructure
    class Ressource

      def initialize(name)
        @_instance_name = name
        @id=-1
      end

      def id
        if @id == -1
          @id = Yarpler::RessourceHandler.instance.next_id(self)
        end
        @id
      end

      def to_s
        @_instance_name
      end

      def id_datatype
        "int"
      end

      def id_variabletype
        "CONSTANT"
      end

      def is_referenced
        false
      end

      def get_value(attribute)
        self.send(attribute)
      end

      def set_value(attribute, value)
        self.send(attribute+"=",value)
      end

      def set_value_at_index(attribute, value, index)
        self.instance_eval("@"+attribute+"["+index+"]='"+value+"'")
      end

      def load(attribute)
        val = get_value(attribute)
        if val.kind_of?(Array)
          val = array_to_range(val)
        end
        val
      end

      def get_list_of_attributes
        list = Array.new
        self.instance_variables.each do |i|
          if i.to_s=="@_instance_name"
            next
          end
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

      def get_instance_name()
        @_instance_name
      end

    end
  end
end
