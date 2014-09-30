module Yarpler
  class OutputParser

    def initialize(output, problem)
      @output = output
      parse
      fill_output(@tree, problem)
      print_objects(problem)
    end

    def print
      tree_printer(@tree)
    end

    def tree
      @tree
    end

    private

    def print_objects(problem)
      puts "
           "
      problem.objects.each do |k,v|
        puts v.to_yaml
      end
    end

    def fill_output(tree, problem)
      tree.each do |t|
        if t.to_s == "OUTPUT"
          read_variable(t[0].to_s, t[1].to_s, problem)
        else
          fill_output(t, problem)
        end
      end
    end

    def read_variable(var, val, problem)
      instance_name = var.slice(0..(var.index('_')-1))
      field_name = var[var.index('_')+1..var.length]
      arr = field_name.split("_")

      if arr.length == 1
        field_name = arr[0]
        problem.objects[instance_name].set_value(field_name, val)
      elsif arr.length == 2
        field_name = arr[0]
        index_name = arr[1]
        problem.objects[instance_name].set_value_at_index(field_name, val, index_name)
      else
        Yarpler::Log.instance.error "Could not read MiniZinc output! Name of variable %s seems off" % [var]
        abort
      end
    end

    def parse
      out = StringIO.new
      err = StringIO.new
      $stdout = out
      $stderr = err

      lexer = YarplerOutput::Lexer.new(@output)
      tokens = ANTLR3::CommonTokenStream.new(lexer)  #Ein Array
      parser = YarplerOutput::Parser.new(tokens)
      returnValue = parser.start()

      $stdout = STDOUT
      $stderr = STDERR

      if not err.string.empty?
        Yarpler::Log.instance.error err.string
        abort
      else
        @tree = returnValue.tree()
      end

    end

    def tree_printer(tree, depth=0)
      indent = ''
      for i in 0..depth
        indent += "    "
      end

      puts indent+tree.to_s
      tree.each do |thing|
        tree_printer(thing, 1 + depth)
      end

    end
  end
end