module Yarpler
  module Utils
    # SolutionPrinter is responsible for printing the results to the user
    class SolutionPrinter

      # Prints the abstract syntax tree
      #
      # @param tree [ANTLR3::AST::CommonTree] parsed antlr tree object
      # @param depth [Integer] depth to print
      # @return [void]
      def print_ast(tree, depth = 0)
        indent = ''
        (0..depth).each do
          indent += '    '
        end

        puts indent + tree.to_s
        tree.each do |thing|
          print_ast(thing, 1 + depth)
        end
      end

      # Prints the complete model
      #
      # @param problem [Problem] internal datastructure which represents a yarpl problem
      # @return [void]
      def print_model(problem)
        problem.objects.each do |_k, v|
          puts ''
          puts ''
          puts print_datastructure(v)
        end
      end

      # Prints a data structure
      #
      # @param object [Object] object to print
      # @param threshold [String] space to indent
      # @return [void]
      def print_datastructure(object, threshold = '  ')
        out = ''
        if object.is_a?(Yarpler::Models::Relation)
          out << print_relation(object, threshold)
        else
          out << print_object(object, threshold)
        end
        out
      end

      # Prints a relation between objects
      #
      # @param object [Object] object to print
      # @param threshold [String] space to indent
      # @return [void]
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

      # Prints a resource object
      #
      # @param object [Object] object to print
      # @param threshold [String] space to indent
      # @return [void]
      def print_object(object, threshold = '')
        out = '{' +  "\n"
        out << threshold + '"ressource_type": "' + object.class.to_s + '"' + "\n"
        out << threshold + ',"instance_name": "' + object.instance_name + '"' + "\n"

        object.list_of_attributes.each do |a|
          out << print_attribute(a.to_s, object.get_value(a.to_s), threshold)
        end
        out << '}'
      end

      # Prints a single attribute
      #
      # @param name [String] name of the attribute to print
      # param value [String] value of the attribute to print
      # @param threshold [String] space to indent
      # @return [void]
      def print_attribute(name, value, threshold)
        out = ''
        if value.is_a?(Yarpler::Models::Relation)
          out << threshold + ',"' + name + '": "' + print_datastructure(value, threshold + '  ') + '"' + "\n"
        else
          out << threshold + ',"' + name + '": "' + value.to_s + '"' + "\n"
        end
      end
    end
  end
end
