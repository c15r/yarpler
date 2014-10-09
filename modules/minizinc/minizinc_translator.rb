class MinizincTranslator < Yarpler::Extensions::Translator
  T_HEADER = '%% File generated by YARPLER'
  T_INCLUDES = "include \"globals.mzn\";"
  T_FOOTER = ''

  T_CONSTANT = "%s: %s = %s;\n" # int: id_dienst_frei = 0;
  T_OUTPUT = ", \"%s=\" , show(%s) , \" \"   "
  T_SET = "set of int: %s = {%s};\n"
  T_VARIABLE = "var %s: %s;\n" # var 0..2: m0t0;

  FIXNUM_MAX = (2**(0.size * 8 - 2) - 1)
  FIXNUM_MIN = -(2**(0.size * 8 - 2))

  SPACE = ' '
  NEWLINE = "\n"
  LCBRACKET = '{'
  RCBRACKET = '}'
  DOUBLE_NEWLINE = NEWLINE * 2
  TAB = "\t"

  def get_array_index
    @array_index = @array_index.next
    @array_index
  end

  def before_translate(problem)
    problem
  end

  def after_translate(problem)
    minizinc_runner = MinizincRunner.new
    minizinc_runner.run(@output)

    OutputParser.new(minizinc_runner.output, problem)
    problem
  end

  def translate(problem)
    # Initialize
    @array_index = 0

    # Setup HEADER and INCLUDES
    code = T_HEADER + DOUBLE_NEWLINE
    code << T_INCLUDES + DOUBLE_NEWLINE

    # Generate variables
    attribute_translator = MinizincAttributeTranslator.new
    code << attribute_translator.translate(problem.objects) + DOUBLE_NEWLINE

    # Generate constraints
    constraint_translator = MinizincConstraintTranslator.new
    code << constraint_translator.translate(problem) + DOUBLE_NEWLINE

    # Generate solve instructions
    solve_translator = MinizincSolveTranslator.new
    code << solve_translator.translate(problem) + DOUBLE_NEWLINE

    # Output
    code << 'output [ "" ' + attribute_translator.attribute_output + '];' + DOUBLE_NEWLINE

    # Footer
    code << T_FOOTER
    @output = code
  end

  class MinizincAttributeTranslator
    attr_reader :attribute_output

    def initialize
      @attribute_output = ''
    end

    def translate(objects)
      result = ''
      objects.each do |key, var|
        var.get_list_of_attributes
        result << convert_attributes(key, var)
      end
      result
    end

    def convert_attributes(name, resource, reference = false)
      code = ''
      resource.get_list_of_attributes.each do |a|
        case resource.get_variabletype(a)
          when 'CONSTANT'
            if reference
              next
            end
            value = resource.load(a)
            if not value.nil?
              code << T_CONSTANT % [resource.get_datatype(a), name + '_' + a, value]
            end
          when 'VARIABLE'
            code << T_VARIABLE % [resource.load(a), name + '_' + a]
            @attribute_output << T_OUTPUT % [name + '_' + a, name + '_' + a]
          when 'VARIABLE_HASONE'
            r = resource.get_value(a)
            relation = MinizincRelationTranslator.new
            code << relation.translate_var(r)
            @attribute_output << relation.output
          when 'CONSTANT_HASONE'
            r = resource.get_value(a)
            relation = MinizincRelationTranslator.new
            code << relation.translate_const(r)
        end
      end
      code
    end
  end

  class MinizincRelationTranslator
    attr_accessor :output

    def initialize
      @output = ''
    end

    def translate_const(relation)
      code = ''
      var_name = MinizincFieldTranslator.new.resolve_variable_from_field(relation.from)
      code << T_CONSTANT % ['int', var_name, 1]
      code
    end

    def translate_var(relation)
      code = ''
      var_name = MinizincFieldTranslator.new.resolve_variable_from_field(relation.from)
      if constant_range?(relation.to)
        code << T_VARIABLE % [array_to_constant_range(relation.to), var_name]
      else
        set_name = 'SET_' + var_name
        code << T_SET % [set_name, array_to_set_range(relation.to)]
        code << T_VARIABLE % [set_name, var_name]
      end

      @output << T_OUTPUT % [var_name, var_name]

      code
    end

    private

    ## Checks if the range is constant (0,1,2) or not (0,1,3)
    def constant_range?(array)
      values = []
      answer = true
      array.each do |o|
        values.push(o.id)
      end
      values.sort

      last_value = nil
      values.each do |v|

        if last_value.nil?
          last_value = v
          next
        end

        if last_value + 1 == v
          last_value = v
        else
          answer = false
          break
        end
      end
      answer
    end

    def array_to_set_range(array)
      range = ''
      is_first = true
      array.each do |o|
        unless is_first
          range << ', '
        end
        range << o.id.to_s
        is_first = false
      end
      range
    end

    def array_to_constant_range(array)
      min = FIXNUM_MAX
      max = FIXNUM_MIN
      array.each do |o|
        if min > o.id
          min = o.id
        end

        if max < o.id
          max = o.id
        end
      end
      min.to_s + '..' + max.to_s
    end
  end

  class MinizincOperatorTranslator
    def initialize

    end

    def translate(operator)
      case operator
        when 'and'
          '/\\'
        else
          operator
      end

    end
  end

  class MinizincSolveTranslator
    def initialize
    end

    def translate(problem)
      code = 'solve '
      case problem.solve.statement
        when 'SATISFY'
          code << 'satisfy' + NEWLINE
        when 'MINIMIZE'
          code << 'minimize ' + MinizincExpressionTranslator.new.translate(problem.solve.expression, problem) + NEWLINE
        when 'MAXIMIZE'
          code << 'maximize ' + MinizincExpressionTranslator.new.translate(problem.solve.expression, problem) + NEWLINE
      end
      code << ';' + DOUBLE_NEWLINE
      code
    end
  end

  class MinizincConstraintTranslator
    def initialize
    end

    def translate(problem)
      code = ''
      problem.constraints.each do |constraint|
        code <<  'constraint' + NEWLINE
        constraint.expressions.each do |expression|
          code << TAB + MinizincExpressionTranslator.new.translate(expression, problem) + NEWLINE
        end
        code << ';' + DOUBLE_NEWLINE
      end
      code
    end
  end

  class MinizincExpressionTranslator
    def initialize
    end

    def translate(expression, problem)
      translate_expression(expression, problem)
    end

    def translate_expression(expression, problem)
      code = ''
      code << resolve_expression(expression.left, problem) + SPACE
      code << MinizincOperatorTranslator.new.translate(expression.operator.to_s)
      code << SPACE + resolve_expression(expression.right, problem)
    end

    def resolve_expression(expression, problem)
      if expression.is_a? Yarpler::Models::Field
        MinizincFieldTranslator.new.resolve_variable_from_field(expression)
      elsif expression.is_a? Yarpler::Models::Instance
        MinizincFieldTranslator.new.resolve_variable_from_instance(expression)
      elsif expression.is_a? Yarpler::Models::Function
        MinizincFunctionTranslator.new.translate(expression, problem)
      elsif expression.is_a? Yarpler::Models::Expression
        MinizincExpressionTranslator.new.translate(expression, problem)
      elsif expression.is_a? Yarpler::Models::Literal
        MinizincLiteralTranslator.new.translate(expression, problem)
      end
    end
  end

  class MinizincLiteralTranslator
    def translate(literal, problem)
      code = literal.value
      code
    end
  end

  class MinizincFieldTranslator
    def resolve_variable_from_instance(field)
      field.variable + '_id'
    end

    def resolve_variable_from_field(field)
      field.variable + '_' + field.attribute
    end
  end

  class MinizincFunctionTranslator
    def initialize
    end

    def translate(function, problem)
      if function.is_a? Yarpler::Models::CountFunction
        translate_count_function(function, problem)
      elsif function.is_a? Yarpler::Models::SumFunction
        translate_sum_function(function, problem)
      end
    end

    def translate_sum_function(function, problem)
      index = MinizincHelper.instance.get_array_id
      first = true
      objects = function.elements

      code = 'let' + SPACE + LCBRACKET + 'array[1..' + objects.size.to_s + '] of var int: array' + index.to_s + ' = ['

      objects.each do |obj|
        if first
          first = false
        else
          code << ','
        end
        code << 'bool2int(' + MinizincExpressionTranslator.new.translate(obj, problem) + ')'
      end

      code << ' ]} in sum(t0 in 1..' + objects.size.to_s + ')(array' + index.to_s + '[t0])'
    end

    def translate_count_function(function, problem)
      # @TODO mach automatisch und besser
      index = MinizincHelper.instance.get_array_id
      first = true
      variable_to_check = function.element.variable + '_id'
      objects = problem.get_objects_of_class(function.range.variable)
      attribute = function.range.attribute

      code = 'let' + SPACE + LCBRACKET + 'array[1..' + objects.size.to_s + '] of var int: array' + index.to_s + ' = ['

      objects.each do |obj|
        if first
          first = false
        else
          code << ','
        end
        code << 'bool2int(' + variable_to_check + '==' + resolve_variable_from_object_and_attribute_name(obj, attribute) + ')'
      end

      code << ' ]} in sum(t0 in 1..' + objects.size.to_s + ')(array' + index.to_s + '[t0])'
    end

    def resolve_variable_from_object_and_attribute_name(obj, attribute)
      obj.get_instance_name + '_' + attribute
    end
  end
end
