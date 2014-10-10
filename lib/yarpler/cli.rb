require 'thor'

module Yarpler
  class CLI < Thor
    def initialize(*args)
      super
      Yarpler::Log.instance.switch_level(:debug)
    end

    desc 'solve [FILE] [TRANSLATORS]', 'Parse input file and solve it'
    option :displaytree, aliases: :tree
    option :displaymodel, aliases: :model
    option :noresult
    def solve(file, *args)
      yarpler = Yarpler::Runner.new

      # Load the abstract syntax tree from input
      Yarpler::Log.instance.info 'Load abstract syntax tree from input.'
      tree = yarpler.tree(file)
      if options[:displaytree]
        print_input_tree(tree)
      end

      # Convert the AST to an object structure
      Yarpler::Log.instance.info 'Convert the AST to an object structure.'
      objects = yarpler.load(tree)
      if options[:displaymodel]
        print_output_objects(objects)
      end

      args.each do |a|
        class_name = a.to_s
        unless class_exists?(class_name)
          Yarpler::Log.instance.error class_name + ' is not located in the lib folder.'
          abort
        end

        extension = Object.const_get(class_name).new

        if extension.is_a?(Yarpler::Extensions::Translator)
          Yarpler::Log.instance.info 'Run translator ' + extension.class.to_s
          objects = extension.before_translate(objects)
          extension.translate(objects)
          objects = extension.after_translate(objects)
        elsif extension.is_a?(Yarpler::Extensions::Process)
          Yarpler::Log.instance.info 'Run process ' + extension.class.to_s
          objects = extension.process(objects)
        else
          Yarpler::Log.instance.error class_name + ' is not inherited by a supported superclass.'
          abort
        end
      end
      unless options[:noresult]
        print_output_objects(objects)
      end

      # check if we had an error and end program
      if (Yarpler::Log.instance.haserror)
        exit(1)
      end
    end

    private

    def class_exists?(class_name)
      klass = Object.const_get(class_name)
      return klass.is_a?(Class)
    rescue NameError
      return false
    end

    def print_input_tree(tree, depth = 0)
      indent = ''
      for i in 0..depth
        indent += '    '
      end

      puts indent + tree.to_s
      tree.each do |thing|
        print_input_tree(thing, 1 + depth)
      end
    end

    def print_output_tree(tree, depth = 0)
      indent = ''
      for i in 0..depth
        indent += '    '
      end

      puts indent + tree.to_s
      tree.each do |thing|
        print_output_tree(thing, 1 + depth)
      end
    end

    def print_output_objects(problem)
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
