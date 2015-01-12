module Yarpler
  module Interpreters

    attr_reader :init

    # ClassInterpreter processes a YARPL Class which defines the data model for a specific problem
    #
    # == YARPL Example
    #
    #   class { ... }
    #
    class ClassInterpreter

      # Inizialize the interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def initialize(tree)
        @init = Hash.new
        @dynamic_name = tree[0].to_s
        Object.const_set(@dynamic_name, Class.new(Yarpler::Models::Resource) {})
        load_attributes(tree[0])

        init = @init
        create_method(@dynamic_name, 'initialize_variables'.to_sym) do
          init.each do |k,v|
            self.set_value(k,v)
          end
        end
      end

      private

      # Loads all attributes in the tree
      #
      # @param tree [ANTLR3::AST::CommonTree] attribute nodes interpreted by ANTRL
      # @return [void]
      def load_attributes(tree)
        tree.each do |thing|
          case thing.to_s
            when 'FIELD_DECLARATION'
              create_attr(@dynamic_name, thing[2].to_s, thing[1], thing[0].to_s)
              if (thing.size == 4)
                add_attribute_init(thing[2].to_s, thing[3].to_s, thing[0].to_s)
              end
            when 'REFERENCE'
              create_attr(@dynamic_name, thing[3].to_s, thing[2].to_s, thing[0].to_s + '_' + thing[1].to_s)
          end
        end
      end

      # Adds an initalizer for the variable
      #
      # @param attr [String] attribute name
      # @param value [Object] value of the attribute
      # @param type [String] type of the attribute
      # @return [void]
      def add_attribute_init(attr, value, type)
        if value.to_s == 'SET'
          @init[attr] = SetInterpreter.new(thing[1])
        else
          @init[attr] = prepare_value(type, value);
        end
      end

      # Takes value declaration apart if they are a continuous range
      #
      # @param type [String] type of an attribute
      # @param value [Ojbect] value of an attribute
      # @return value [Object] processed value
      def prepare_value(type, value)
        if type == 'VARIABLE' &&  !value.include?('..')
          value = value.to_s + '..' + value.to_s
        end
        value
      end

      # Creates a method block in the class
      #
      # @param obj_name [String] name of an object
      # @param name [String] name of the method
      # @param block [Object] code block of the method
      # @return [void]
      def create_method(obj_name, name, &block)
        Object.const_get(obj_name).send(:define_method, name, &block)
      end

      # Removes a method block in the class
      #
      # @param obj_name [String] name of an object
      # @param name [String] name of the method
      # @return [void]
      def remove_method(obj_name, name)
        Object.const_get(obj_name).send(:remove_method, name)
      end

      # Creates an attribute block in the class
      #
      # @param obj_name [String] name of an object
      # @param name [String] name of the method
      # @param data_type [String] data type of the attribute
      # @param variable_type [String] variable type of the attribute
      # @return [void]
      def create_attr(obj_name, name, data_type, variable_type)
        create_method(obj_name, "#{name}=".to_sym) do |val|
          instance_variable_set('@' + name, val)
        end

        create_method(obj_name, name.to_sym) do
          instance_variable_get('@' + name)
        end

        set_data_type(obj_name, name, data_type)
        set_variable_type(obj_name, name, variable_type)
      end

      # Creates a method to determine the variable type per attribute
      #
      # # @param obj_name [String] name of an object
      # @param name [String] name of the method
      # @param variable_type [String] variable type of the attribute
      # @return [void]
      def set_variable_type(obj_name, name, variable_type)
        create_method(obj_name, "#{name}_variabletype".to_sym) do
          variable_type
        end
      end

      # Creates a method to determine the data type
      #
      # @param obj_name [String] name of an object
      # @param name [String] name of the method
      # @param data_type [String] data type of the attribute
      # @return [void]
      def set_data_type(obj_name, name, data_type)
        case data_type.to_s
          when 'INTEGER'
            datatype = 'int'
          else
            datatype = data_type.to_s
        end

        create_method(obj_name, "#{name}_datatype".to_sym) do
          datatype
        end
      end
    end
  end
end
