module Yarpler
  module Interpreter
    class InitialInterpreter
      attr_accessor :objects
      attr_accessor :constraints

      def initialize(tree)
        @objects = {}
        @constraints = []
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
            when 'CONSTRAINT_DECLARATION'
              c = ConstraintInterpreter.new(thing)
              @constraints.push(c.constraint)
            when 'RELATION_DECLARATION'
              r = RelationInterpreter.new(thing, @objects).relation
              @objects[r.from.variable.to_s].set_value(r.from.attribute.to_s, r)
          end
        end
      end

      def initialize_relations(object)
        object.get_list_of_attributes.each do |a|
          case object.get_variabletype(a.to_s)
            when 'VARIABLE_HASONE'
              class_name = object.get_datatype(a.to_s)

              field = Yarpler::Models::Field.new
              field.variable = object.get_instance_name
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
        # @TODO REINGENEER
        tree.each do |thing|
          case thing.to_s
            when 'ATTRIBUTE'
              if thing[1].to_s == 'SET'
                current_obj.set_value(thing[0].to_s, SetInterpreter(thing[1]).set, objects)
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

      class RelationInterpreter
        attr_reader :relation

        def initialize(tree, objects)
          @relation = Yarpler::Models::Relation.new
          parse_relation(tree, objects)
        end

        private

        def parse_relation(relation, objects)
          # @TODO Error Handling if const and SET and other wrong inputs
          @relation.from = FieldAccessorInterpreter.new(relation[0]).field
          @relation.type = objects[@relation.from.variable.to_s].get_variabletype(@relation.from.attribute.to_s)
          @relation.to = SetInterpreter.new(relation[1], objects).set
        end
      end

      class SetInterpreter
        attr_accessor :set

        def initialize(item, objects)
          @set = []
          process_set(item, objects)
        end

        def process_set(tree, objects)
          # @TODO Error handling
          tree.each do |thing|
            set.push(objects[thing.to_s])
          end
          set
        end
      end
    end
  end
end
