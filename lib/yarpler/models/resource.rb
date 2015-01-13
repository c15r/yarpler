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
      attr_reader :instance_name

      # Initializes the model object
      #
      # @return [void]
      def initialize(name)
        @instance_name = name
        @id = -1
        initialize_variables
      end

      # Id of the resource
      #
      # @return [Integer]
      def id
        @id = Yarpler::ResourceHandler.instance.next_id(self) if @id == -1
        @id
      end

      # returns the instance name as a string
      #
      # @return [String]
      def to_s
        @instance_name
      end

      # returns the data type of the id attribute as a string
      #
      # @return [String]
      def id_datatype
        'int'
      end

      # returns the variable type of the id attribute as a string
      #
      # @return [String]
      def id_variabletype
        'CONSTANT'
      end

      # Gets a value based on a string
      #
      # @return [void]
      def get_value(attribute)
        send(attribute)
      end

      # Sets a value based on a string
      #
      # @return [void]
      def set_value(attribute, value)
        send(attribute + '=', value)
      end

      # Sets the value at an index in an array
      #
      # @return [void]
      def set_value_at_index(attribute, value, index)
        instance_eval('@' + attribute + '[' + index + "]='" + value + "'")
      end

      # Loads an attriubte by string
      #
      # @return [String]
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

      # Lists all attributes of the resource
      #
      # @return [Array<String>]
      def list_of_attributes
        unwanted = ['=', '_datatype', '_variabletype']
        all_methods = []
        preprare_attributes(all_methods, unwanted)
        all_methods
      end

      # Prepares all attributes by pushing sets and so on
      #
      # @return [void]
      def preprare_attributes(all_methods, unwanted)
        attribute_methods.each do |x|
          set = true
          unwanted.each do |u|
            if x.to_s.include? u.to_s
              set = false
              break
            end
          end
          all_methods.push(x.to_s) if set
        end
      end

      # Lists all methods that belong to an attribute
      #
      # @return [Array]
      def attribute_methods
        methods - Object.methods - [:validate_initialization, :list_of_attributes,
                                    :load, :get_value, :set_value,
                                    :set_value_at_index, :instance_name,
                                    :get_datatype, :get_variabletype,
                                    :preprare_attributes, :attribute_methods,
                                    :initialize_variables]
      end

      # Gets the datatype of an attribute based on string
      #
      # @return [void]
      def get_datatype(attribute)
        send(attribute + '_datatype')
      end

      # Gets the Variable type of an attribute based on string
      #
      # @return [void]
      def get_variabletype(attribute)
        send(attribute + '_variabletype')
      end

      # Validates the initialization of all attributes
      #
      # @return [void]
      def validate_initialization
        list_of_attributes.each do |a|
          if get_variabletype(a) == 'CONSTANT'
            if get_value(a).nil?
              fail Yarpler::Exceptions::UninitializedConstantException.new(@instance_name, a)
            end
          else
            # @TODO implement
          end
        end
      end
    end
  end
end
