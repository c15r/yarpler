module Yarpler
  class OutputParser

    def initialize(output, problem)
      @output = output
      parse
      fill_output(@tree, problem)
      @problem = problem
    end

    def tree
      @tree
    end

    def problem
      @problem
    end

    private

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

      # @TODO: Reingineering, etwas schöner machen

      instance_name = var.slice(0..(var.index('_')-1))
      field_name = var[var.index('_')+1..var.length]
      arr = field_name.split("_")

      if arr.length == 1
        field_name = arr[0]
        problem.objects[instance_name].set_value(field_name, val)
      elsif arr.length == 2
        field_name = arr[0]
        index_name = arr[1]

        if problem.objects[instance_name].get_variabletype(field_name) == "REFERENCE"
          datatype = problem.objects[instance_name].get_datatype(field_name)
          problem.objects.each do |k,v|
            #puts v.class.to_s+"..."+val.to_s+"---"+datatype.to_s
            if v.class.to_s == datatype.to_s
              if v.id.to_s == val.to_s
                val=v.to_s
                break
              end
            end
          end
        end
        #puts field_name.to_s + ", " + val.to_s + ", " + index_name.to_s
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
      return_value = parser.start()

      $stdout = STDOUT
      $stderr = STDERR

      if not err.string.empty?
        Yarpler::Log.instance.error err.string
        abort
      else
        @tree = return_value.tree()
      end

    end
  end
end