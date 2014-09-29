module Yarpler
  module Interpreter
    class InitialInterpreter

      attr_accessor :objects
      attr_accessor :constraints

      def initialize(tree)
        @objects = Hash.new
        @constraints = Array.new
        tree_converter(tree)
      end

      def tree_converter(tree)
        tree.each do |thing|
          # @TODO evtl noch etwas schöner mit ENUM?
          case thing.to_s
            when "VARIABLE_DECLARATOR"
              current_name = thing[0].to_s
              new_object = Yarpler::RessourceHandler.instance.new_object(current_name, thing[1][0].to_s)

              @objects[current_name] = new_object
              attribute_reader(thing[1], new_object)
            when "CONSTRAINT_DECLARATION"
              c = ConstraintInterpreter.new(thing)
              @constraints.push(c.constraint)
          end
        end
      end

      def attribute_reader(tree, current_obj)
        tree.each do |thing|
          case thing.to_s
            when "ATTRIBUTE"
              if thing[1].to_s == "SET"
                current_obj.set_value(thing[0].to_s, build_set(thing[1]))
              elsif thing[1].to_s == "LIST"
                  current_obj.set_value(thing[0].to_s, build_list(thing[1]))
              else
                value = prepare_value(current_obj.get_variabletype(thing[0].to_s), thing[1].to_s)
                current_obj.set_value(thing[0].to_s, value)
              end
          end
        end
      end

      def build_list(tree)
        # @TODO Error handling
        set = Array.new
        tree.each do |thing|
          case thing.to_s
            when "SET"
              set.push(build_set(thing))
            else
              set.push(@objects[thing.to_s])
          end
        end
        set
      end

      def build_set(tree)
        # @TODO Error handling
        set = Array.new
        tree.each do |thing|
          set.push(@objects[thing.to_s])
        end
        set
      end

      def prepare_value(type, value)
        if type == "VARIABLE"
          if not value.include? ".."
            value = value.to_s + ".." + value.to_s
          end
        end
        value
      end

    end
  end
end
