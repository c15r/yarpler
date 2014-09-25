module Yarpler
  module Interpreter
    class InitialInterpreter

      def problem
        @problem
      end

      def problem=(new_problem)
        @problem = new_problem
      end

      def initialize(tree)
        full_list = Hash.new
        tree_converter(tree, full_list)
        self.problem=full_list
      end

      def tree_converter(tree, full_list)
        tree.each do |thing|
          # @TODO evtl noch etwas schöner mit ENUM?
          case thing.to_s
            when "VARIABLE_DECLARATOR"
              current_name = thing[0].to_s
              full_list[current_name] = Yarpler::RessourceHandler.instance.new_object(thing[1][0].to_s)
              attribute_reader(thing[1], full_list[current_name])
              self.problem=full_list
          end
        end
      end

      def attribute_reader(tree, current_obj)
        tree.each do |thing|
          case thing.to_s
            when "ATTRIBUTE"
              if thing[1].to_s == "SET"
                current_obj.set_value(thing[0].to_s, build_set(thing[1]))
              else
                current_obj.set_value(thing[0].to_s, thing[1].to_s)
              end
          end
        end
      end

      def build_set(tree)
        # @TODO Error handling
        set = Array.new
        tree.each do |thing|
          set.push(problem[thing.to_s])
        end
        set
      end

    end
  end
end
