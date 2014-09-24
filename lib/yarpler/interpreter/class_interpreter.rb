module Yarpler
  module Interpreter
    class ClassInterpreter

      def initialize(tree)
        @dynamic_name = tree[0].to_s
        Object.const_set(@dynamic_name, Class.new(Yarpler::Datastructure::Ressource) { })
        load_attributes(tree[0])
      end

      private

      def load_attributes(tree)

        # @TODO: Lade Zusatzinfo wie Datatype oder VAR/CONST

        tree.each do |thing|
          case thing.to_s
            when "FIELD_DECLARATION"
              create_attr(thing[1].to_s, thing[0])
          end
        end

      end

      def create_method( name, &block )
        Object.const_get(@dynamic_name).send( :define_method, name, &block )
      end

      def create_attr( name, properties )

        create_method( "#{name}=".to_sym ) { |val|
          instance_variable_set( "@" + name, val)
        }

        create_method( name.to_sym ) {
          instance_variable_get( "@" + name )
        }

        set_properties(name, properties)
      end

      def set_properties(name, properties)

        case properties[0].to_s
          when "INTEGER"
            datatype="int"
          else
            datatype="undefined"
        end

        create_method( "#{name}_datatype".to_sym ) {
          datatype
        }
      end

    end
  end
end
