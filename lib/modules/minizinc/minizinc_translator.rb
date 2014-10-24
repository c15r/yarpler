require_relative 'minizinc_runner'
require_relative 'minizinc_helper'
require_relative 'minizinc_helper'
require_relative 'output_parser'

##
# Translator implementation to convert the solution to Minizinc
class MinizincTranslator < Yarpler::Extensions::Translator
  T_HEADER = '%% File generated by YARPLER'
  T_INCLUDES = "include \"globals.mzn\";"
  T_FOOTER = ''

  T_CONSTANT = "%s: %s = %s;\n" # int: id_dienst_frei = 0;
  T_OUTPUT = ", \"%s=\" , show(%s) , \" \"   "
  T_SET = "set of int: %s = {%s};\n"
  T_VARIABLE = "var %s: %s;\n" # var 0..2: m0t0;
  T_VARIABLE_SET = "var set of {%s}: %s;\n"

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

  ##
  # Translates attributes from the solution to Minizinc variables or constants
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
            unless value.nil?
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
          when 'VARIABLE_HASMANY'
            r = resource.get_value(a)
            relation = MinizincRelationTranslator.new
            code << relation.translate_var_set(r)
            @attribute_output << relation.output
          when 'CONSTANT_HASMANY'
            r = resource.get_value(a)
            relation = MinizincRelationTranslator.new
            code << relation.translate_const(r)
        end
      end
      code
    end
  end

  ##
  # Translates relations to Minizinc variables
  class MinizincRelationTranslator
    attr_accessor :output

    def initialize
      @output = ''
    end

    def translate_const(relation)
      # @TODO is this always correct?
      code = ''
      var_name = MinizincFieldTranslator.new.resolve_variable_from_field(relation.from)
      if relation.to.size > 1
        code << T_SET % [var_name, array_to_set_range(relation.to)]
      else
        code << T_CONSTANT % ['int', var_name, relation.to[0].id]
      end
      code
    end

    def translate_var_set(relation)
      code = ''
      var_name = MinizincFieldTranslator.new.resolve_variable_from_field(relation.from)
      #code << T_SET % [set_name, array_to_set_range(relation.to)]
      code << T_VARIABLE_SET % [array_to_set_range(relation.to), var_name]
      @output << T_OUTPUT % [var_name, var_name]

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

  ##
  # Translates operators to the Minizinc equivalents
  class MinizincOperatorTranslator
    def initialize
    end

    def translate(operator)
      case operator
        when 'and'
          '/\\'
        when 'or'
          '\\/'
        else
          operator
      end
    end
  end

  ##
  # Translate the solve section to minizinc
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

  ##
  # Translates constraints to Minizinc Constraints
  class MinizincConstraintTranslator
    def initialize
    end

    def translate(problem)
      code = ''
      problem.constraints.each do |constraint|
        expression = constraint.expression
        if expression.is_a? Yarpler::Models::Expression
          code <<  'constraint' + NEWLINE
          code << TAB + MinizincExpressionTranslator.new.translate(expression, problem) + NEWLINE
          code << ';' + DOUBLE_NEWLINE
        elsif expression.is_a? Yarpler::Models::Forall
          # @TODO Muss das überhaupt implementiert werden, oder wird immer vorher geflattet?
        end
      end
      code
    end
  end

  ##
  # Translates expressions to Minizinc expressions
  class MinizincExpressionTranslator
    def initialize
    end

    def translate(expression, problem)
      translate_expression(expression, problem)
    end

    def translate_expression(expression, problem)
      code = ''
      code << resolve_expression(expression.left, problem) + SPACE

      # no operator and right for literal expressions
      if expression.operator.to_s != 'LITERAL'
        code << MinizincOperatorTranslator.new.translate(expression.operator.to_s)
        code << SPACE + resolve_expression(expression.right, problem)
      end
      code
    end

    def resolve_expression(expression, problem)
      if expression.is_a? Yarpler::Models::Field
        MinizincFieldTranslator.new.resolve_variable_from_field(expression)
      elsif expression.is_a? Yarpler::Models::Instance
        MinizincFieldTranslator.new.resolve_variable_from_instance(expression)
      elsif expression.is_a? Yarpler::Models::Absolute
        MinizincAbsoluteTranslator.new.translate(expression.expression, problem)
      elsif expression.is_a? Yarpler::Models::Function
        MinizincFunctionTranslator.new.translate(expression, problem)
      elsif expression.is_a? Yarpler::Models::Expression
        MinizincExpressionTranslator.new.translate(expression, problem)
      elsif expression.is_a? Yarpler::Models::Literal
        MinizincLiteralTranslator.new.translate(expression)
      end
    end
  end

  ##
  # Translates an absolute expression to Minizinc
  class MinizincAbsoluteTranslator
    def translate(expression, problem)
      code = 'abs('
      if expression.is_a? Yarpler::Models::Field
        code << MinizincFieldTranslator.new.resolve_variable_from_field(expression)
      elsif expression.is_a? Yarpler::Models::Instance
        code << MinizincFieldTranslator.new.resolve_variable_from_instance(expression)
      elsif expression.is_a? Yarpler::Models::Expression
        code << MinizincExpressionTranslator.new.translate(expression, problem)
      elsif expression.is_a? Yarpler::Models::Literal
        code << MinizincLiteralTranslator.new.translate(expression)
      end
      code << ')'
      code
    end
  end

  ##
  # Translates a literal to a minizinc variable
  class MinizincLiteralTranslator
    def translate(literal)
      code = literal.value
      code
    end
  end

  ##
  # Translates a field or an instance to Minizinc
  class MinizincFieldTranslator
    def resolve_variable_from_instance(field)
      field.variable + '_id'
    end

    def resolve_variable_from_field(field)
      field.variable.to_s + '_' + field.attribute.to_s
    end
  end

  ##
  # Translates SUM or COUNT functions to Minizinc
  class MinizincFunctionTranslator
    def initialize
    end

    def translate(function, problem)
      if function.is_a? Yarpler::Models::CountFunction
        translate_count_function(function, problem)
      elsif function.is_a? Yarpler::Models::SumFunction
        translate_sum_function(function, problem)
      elsif function.is_a? Yarpler::Models::SumValueFunction
        translate_sum_value_function(function, problem)
      end
    end

    def translate_sum_value_function(function, problem)
      index = MinizincHelper.instance.get_array_id
      first = true
      objects = load_sum_objects(function, problem)

      code = 'let' + SPACE + LCBRACKET + 'array[1..' + objects.size.to_s + '] of var int: array' + index.to_s + ' = ['

      objects.each do |o|
        code << translate_sum_value_body(first, function, o, problem)
        first = false if first
      end

      code << ' ]} in sum(t0 in 1..' + objects.size.to_s + ')(array' + index.to_s + '[t0])'
    end

    def load_sum_objects(function, problem)
      if function.elements.is_a?(Yarpler::Models::Relation)
        objects = function.elements.to
      elsif function.elements.is_a?(Yarpler::Models::Field)
        # @TODO Stimmt das immer?
        obj = problem.objects[function.elements.variable]
        objects = obj.get_value(function.elements.attribute).to
      else
        # @TODO : Mach Exception
      end
      objects
    end

    def translate_sum_value_body(first, function, o, problem)
      code = ''
      code << ',' unless first

      # operator in can be used for set of var
      operator = load_sum_operator(function, problem)
      code << resolve_variable_from_object_and_attribute_name(o, function.attribute)
      code << '*bool2int(' + o.id.to_s + ' ' + operator + ' '
      code << MinizincFieldTranslator.new.resolve_variable_from_field(function.set) + ')'
    end

    def load_sum_operator(function, problem)
      operator = 'in'
      case problem.objects[function.set.variable].get_variabletype(function.set.attribute)
        when 'VARIABLE_HASONE'
          operator = '=='
        when 'CONSTANT_HASONE'
          operator = '=='
      end
      operator
    end

    def translate_sum_function(function, problem)
      index = MinizincHelper.instance.get_array_id
      first = true
      objects = function.elements

      code = 'let' + SPACE + LCBRACKET + 'array[1..' + objects.size.to_s + '] of var int: array' + index.to_s + ' = ['

      objects.each do |obj|
        code << ',' unless first
        code << 'bool2int(' + MinizincExpressionTranslator.new.translate(obj, problem) + ')'
        first = false if first
      end

      code << ' ]} in sum(t0 in 1..' + objects.size.to_s + ')(array' + index.to_s + '[t0])'
    end

    def translate_count_function(function, problem)
      index = MinizincHelper.instance.get_array_id
      first = true
      variable_to_check = function.element.variable + '_id'
      objects = problem.get_objects_of_class(function.range.variable)

      code = 'let' + SPACE + LCBRACKET + 'array[1..' + objects.size.to_s + '] of var int: array' + index.to_s + ' = ['
      objects.each do |obj|
        code << translate_count_body(function.range.attribute, first, obj, variable_to_check)
        first = false if first
      end

      code << ' ]} in sum(t0 in 1..' + objects.size.to_s + ')(array' + index.to_s + '[t0])'
    end

    def translate_count_body(attribute, first, obj, variable_to_check)
      code = ''
      code << ',' unless first
      code << 'bool2int('
      code << variable_to_check + '==' + resolve_variable_from_object_and_attribute_name(obj, attribute)
      code << ')'
    end

    def resolve_variable_from_object_and_attribute_name(obj, attribute)
      obj.get_instance_name + '_' + attribute
    end
  end
end
