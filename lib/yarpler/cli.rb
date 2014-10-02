require 'thor'

module Yarpler
  class CLI < Thor

    def initialize(*args)
      super
      Yarpler::Log.instance.switch_level(:debug)
      Yarpler::Log.instance.info "Welcome to YARPLER!"
    end

    desc "tree FILE", "Display the AST of the input file"
    def tree(file)
      yarpler = Yarpler::Runner.new
      print_input_tree(yarpler.tree(file))
    end

    desc "translate FILE", "Parse input file and translate to MiniZinc"
    def translate(file)
      yarpler = Yarpler::Runner.new
      puts yarpler.translate(file)
    end

    desc "solve FILE", "Parse input file and solve it"
    def solve(file)
      yarpler = Yarpler::Runner.new
      print_output_objects(yarpler.solve(file))
    end

    private

    def print_input_tree(tree, depth=0)
      indent = ''
      for i in 0..depth
        indent += "    "
      end

      puts indent+tree.to_s
      tree.each do |thing|
        print_input_tree(thing, 1 + depth)
      end
    end


    def print_output_tree(tree, depth=0)
      indent = ''
      for i in 0..depth
        indent += "    "
      end

      puts indent+tree.to_s
      tree.each do |thing|
        print_output_tree(thing, 1 + depth)
      end
    end

    def print_output_objects(problem)
      puts "
           "
      problem.objects.each do |k,v|
        puts v.to_yaml
      end
    end
  end
end