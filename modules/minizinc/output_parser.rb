class OutputParser
  attr_reader :tree
  attr_reader :problem

  def initialize(output, problem)
    @output = output
    parse
    fill_output(@tree, problem)
    @problem = problem
  end

  private

  def fill_output(tree, problem)
    tree.each do |t|
      if t.to_s == 'OUTPUT'
          if t.size==2
            read_variable(t[0].to_s, t[1].to_s, problem)
          else
            read_variable_list(t[0].to_s, t[1..t.size], problem)
          end
      else
        fill_output(t, problem)
      end
    end
  end

  def read_variable_list(var, values, problem)
    instance_name = var.slice(0..(var.index('_') - 1))
    field_name = var[var.index('_') + 1..var.length]
    if problem.objects[instance_name].get_variabletype(field_name) == 'VARIABLE_HASMANY'
      datatype = problem.objects[instance_name].get_datatype(field_name)

      relation = problem.objects[instance_name].get_value(field_name)
      relation.to.clear

      values.each do |val|
        problem.objects.each do |_k, v|
          if v.class.to_s == datatype.to_s
            if v.id.to_s == val.to_s
              relation.to << v
              break
            end
          end
        end
      end
      problem.objects[instance_name].set_value(field_name, relation)
    end

  end

  def read_variable(var, val, problem)
    # @TODO: Reingineering, etwas schöner machen
    instance_name = var.slice(0..(var.index('_') - 1))
    field_name = var[var.index('_') + 1..var.length]
    arr = field_name.split('_')

    if problem.objects[instance_name].get_variabletype(field_name) == 'VARIABLE_HASONE'
      datatype = problem.objects[instance_name].get_datatype(field_name)
      problem.objects.each do |_k, v|
        if v.class.to_s == datatype.to_s
          if v.id.to_s == val.to_s
            relation = problem.objects[instance_name].get_value(field_name)
            relation.to.clear
            relation.to << v
            problem.objects[instance_name].set_value(field_name, relation)
            break
          end
        end
      end
    else
      field_name = arr[0]
      problem.objects[instance_name].set_value(field_name, val)
    end
  end

  def parse
    out = StringIO.new
    err = StringIO.new
    $stdout = out
    $stderr = err

    lexer = YarplerOutput::Lexer.new(@output)
    tokens = ANTLR3::CommonTokenStream.new(lexer)  # Ein Array
    parser = YarplerOutput::Parser.new(tokens)
    return_value = parser.start

    $stdout = STDOUT
    $stderr = STDERR

    if !err.string.empty?
      Yarpler::Log.instance.error err.string
      abort
    else
      @tree = return_value.tree
    end
  end
end
