module Yarpler
  module Models
    ##
    # Generic Class to handle the YARPL Model
    #
    # == YARPL Example
    #
    #   model {
    #     class Dienst {
    #       const integer anzahl;
    #     }
    #   }
    class Resource
      def initialize(name)
        @_instance_name = name
        @id = -1
      end

      def id
        if @id == -1
          @id = Yarpler::ResourceHandler.instance.next_id(self)
        end
        @id
      end

      def to_s
        @_instance_name
      end

      def id_datatype
        'int'
      end

      def id_variabletype
        'CONSTANT'
      end

      def is_referenced
        false
      end

      def get_value(attribute)
        send(attribute)
      end

      def set_value(attribute, value)
        send(attribute + '=', value)
      end

      def set_value_at_index(attribute, value, index)
        instance_eval('@' + attribute + '[' + index + "]='" + value + "'")
      end

      def load(attribute)
        val = get_value(attribute)

        # if variable is not set it returns the datatype
        if val.nil?
          val = get_datatype(attribute)
        elsif val.is_a?(Array)
          val = array_to_range(val)
        end
        val
      end

      def get_list_of_attributes
        unwanted = ['=', '_datatype', '_variabletype']
        attribute_methods = methods - Object.methods - [:validate_initialization, :get_list_of_attributes, :is_referenced, :load, :get_value, :set_value, :set_value_at_index, :get_instance_name, :get_datatype, :get_variabletype]
        all_methods = []
        attribute_methods.each do |x|
          set = true
          unwanted.each do |u|
            if x.to_s.include? u.to_s
              set = false
              break
            end
          end

          if set
            all_methods.push(x.to_s)
          end
        end
        all_methods
      end

      def get_datatype(attribute)
        send(attribute + '_datatype')
      end

      def get_variabletype(attribute)
        send(attribute + '_variabletype')
      end

      def get_instance_name
        @_instance_name
      end

      def validate_initialization
        self.get_list_of_attributes.each do |a|
          if self.get_variabletype(a) == "CONSTANT"
            if self.get_value(a).nil?
              raise Yarpler::Exceptions::UninitializedConstantException.new(self.get_instance_name, a)
            end
          end
        end
      end
    end
  end
end
