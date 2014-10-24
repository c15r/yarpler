module Yarpler
  module Utils
    class SolutionPrinter

      def print_ast(tree, depth = 0)
        indent = ''
        for i in 0..depth
          indent += '    '
        end

        puts indent + tree.to_s
        tree.each do |thing|
          print_ast(thing, 1 + depth)
        end
      end
      
      def print_model(problem)
        problem.objects.each do |_k, v|
          puts ''
          puts ''
          puts print_datastructure(v)
        end
      end

      def print_datastructure(object, threshold = '  ')
        out = ''
        if object.is_a?(Yarpler::Models::Relation)
          out << print_relation(object, threshold)
        else
          out << print_object(object, threshold)
        end
        out
      end

      def print_relation(object, threshold = '')
        out = ''
        if object.to.is_a?(Array)
          object.to.each do |o|
            out << print_datastructure(o, threshold)
          end
        else
          out << object.to.to_s
        end
        out
      end

      def print_object(object, threshold = '')
        out = '{' +  "\n"
        out << threshold + '"ressource_type": "' + object.class.to_s + '"' + "\n"
        out << threshold + ',"instance_name": "' + object.get_instance_name + '"' + "\n"
        object.get_list_of_attributes.each do |a|

          val = object.get_value(a.to_s)

          if val.is_a?(Yarpler::Models::Relation)
            out << threshold + ',"' + a.to_s + '": "' + print_datastructure(val, threshold + '  ') + '"' + "\n"
          else
            out << threshold + ',"' + a.to_s + '": "' + val.to_s + '"' + "\n"
          end
        end
        out << '}'
        out
      end
    end
  end
end
