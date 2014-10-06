module Yarpler
  module Interpreter
    class ClassInterpreter

      def initialize(tree)
        @dynamic_name = tree[0].to_s
        Object.const_set(@dynamic_name, Class.new(Yarpler::Models::Resource) { })
        load_attributes(tree[0])
      end

      private

      def load_attributes(tree)
        rh=Yarpler::ResourceHandler.instance

        tree.each do |thing|
          case thing.to_s
            when "FIELD_DECLARATION"
              create_attr(@dynamic_name, thing[2].to_s, thing[1], thing[0].to_s)
            when "REFERENCE"
              create_attr(@dynamic_name, thing[3].to_s, thing[2].to_s, thing[0].to_s+"_"+thing[1].to_s)
              set_is_referenced(thing[2].to_s, true)
          end
        end
      end

      def create_method( obj_name, name, &block )
        Object.const_get(obj_name).send( :define_method, name, &block )
      end

      def remove_method( obj_name, name, &block )
        Object.const_get(obj_name).send( :remove_method, name)
      end

      def create_attr( obj_name, name, data_type, variable_type )

        create_method( obj_name, "#{name}=".to_sym ) { |val|
          instance_variable_set( "@" + name, val)
        }

        create_method( obj_name, name.to_sym ) {
          instance_variable_get( "@" + name )
        }

        set_data_type(obj_name, name, data_type)
        set_variable_type(obj_name, name, variable_type)
      end

      def set_variable_type(obj_name, name, variable_type)
        create_method( obj_name, "#{name}_variabletype".to_sym ) {
          variable_type
        }
      end

      def set_is_referenced(obj_name, value)
        create_method( obj_name, "is_referenced".to_sym ) {
          value
        }
      end

      def set_data_type(obj_name, name, data_type)

        case data_type.to_s
          when "INTEGER"
            datatype="int"
          else
            datatype=data_type.to_s
        end

        create_method( obj_name, "#{name}_datatype".to_sym ) {
          datatype
        }
      end

    end
  end
end
