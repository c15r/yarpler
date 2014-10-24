module Yarpler
  module Interpreters
    class InitialInterpreter
      attr_accessor :objects
      attr_accessor :constraints

      def initialize(tree)
        @objects = {}
        tree_converter(tree)
      end

      def tree_converter(tree)
        tree.each do |thing|
          case thing.to_s
            when 'VARIABLE_DECLARATOR'
              current_name = thing[0].to_s
              new_object = Yarpler::ResourceHandler.instance.new_object(current_name, thing[1][0].to_s)
              @objects[current_name] = new_object
              attribute_reader(thing[1], new_object)
              initialize_relations(new_object)
            when 'RELATION_DECLARATION'
              r = RelationInterpreter.new(thing, @objects).relation
              @objects[r.from.variable.to_s].set_value(r.from.attribute.to_s, r)
          end
        end
      end

      def initialize_relations(object)
        object.list_of_attributes.each do |a|
          case object.get_variabletype(a.to_s)
            when 'VARIABLE_HASONE'
              class_name = object.get_datatype(a.to_s)

              field = Yarpler::Models::Field.new
              field.variable = object.instance_name
              field.attribute = a.to_s

              relation = Yarpler::Models::Relation.new
              relation.from = field
              relation.type = 'VARIABLE_HASONE'
              relation.to = get_objects_of_class(class_name)

              object.set_value(a.to_s, relation)
          end
        end
      end

      def get_objects_of_class(class_name)
        var_array = []
        @objects.each do |_k, v|
          if v.class.to_s == class_name.to_s
            var_array.push(v)
          end
        end
        var_array
      end

      def attribute_reader(tree, current_obj)
        # TODO: REINGENEER
        tree.each do |thing|
          case thing.to_s
            when 'ATTRIBUTE'
              if thing[1].to_s == 'SET'
                current_obj.set_value(thing[0].to_s, SetInterpreter.new(thing[1], objects))
              else
                value = prepare_value(current_obj.get_variabletype(thing[0].to_s), thing[1].to_s)
                current_obj.set_value(thing[0].to_s, value)
              end
          end
        end
      end

      def prepare_value(type, value)
        if type == 'VARIABLE'
          unless value.include? '..'
            value = value.to_s + '..' + value.to_s
          end
        end
        value
      end
    end
  end
end
