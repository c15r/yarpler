# YARPL Flattener is responsible to flatten allquantor statements
#
# It's derived from Extensions::Process and must be invoked to generate proper minizinc code
# rubocop:disable Metrics/ClassLength
class YarplFlattener < Yarpler::Extensions::Process

  # Initializes an array of constraints
  def initialize
    @constraints = []
  end

  # Processes a problem declaration to flatten all allquantor and countall statements
  def process(problem)
    @problem = problem
    problem.constraints.each do |constraint|
      process_constraint(constraint)
    end
    problem.constraints = @constraints

    if allquantors_inside?(problem)
      @constraints = []
      problem = YarplFlattener.new.process(problem)
    end

    problem.constraints.each do |constraint|
      expand_count_all(constraint.expression,problem)
    end

    remove_invalid_constraints(problem)
  end

  private

  # Expands a countAll construct by checking internal forall loops
  def expand_count_all(expression,problem)
    if expression.is_a? Yarpler::Models::Countall
      expressions = Array.new
      expression.range.each do |e|
        expr = expression.expression.clone
        expr = replace_selector(expr, expression.variable, e.instance_name, expression.range)

        if expr.is_a? Yarpler::Models::Forall
          expressions.concat(expand_forall_in_countall(expr, expression, problem))
        else
          expressions << expr
        end
      end
      expression.expressions = expressions
    elsif expression.is_a? Yarpler::Models::Expression
      expand_count_all(expression.left,problem)
      expand_count_all(expression.right,problem)
    end
  end

  # Internal method to revolve forall clauses in countall
  def expand_forall_in_countall(expr, expression, problem)
    expressions = Array.new
    constraints = process_forall_statement(expr)
    constraints.each do |c|
      expressions << c.expression
    end
    expressions
  end

  # Recursive check for constraints to see if there are internal forall statements
  def process_constraint(constraint)
    if constraint.expression.is_a? Yarpler::Models::Forall
      @constraints.concat(process_forall_statement(constraint.expression))
    elsif constraint.expression.is_a? Yarpler::Models::Expression
      @constraints << constraint
    end
  end

  # Removes all invalid constraints
  def remove_invalid_constraints(problem)
    invalid = []
    problem.constraints.each do |constraint|
      invalid << constraint unless constraint.valid?
    end

    invalid.each do |i|
      problem.constraints.delete(i)
    end
    problem
  end

  # Checks if we have other Allquantors inside now
  def allquantors_inside?(problem)
    problem.constraints.each do |constraint|
      return true if constraint.expression.is_a? Yarpler::Models::Forall
    end
    false
  end

  # Processes the range of a forall statement
  def process_forall_statement(forall)
    if forall.range.is_a?(Array)
      process_array_range(forall)
    elsif forall.range.is_a?(Yarpler::Models::Field)
      process_field_range(forall)
    end
  end

  # Processes a range from an array
  def process_array_range(forall)
    constraints = Array.new
    range = order_range(forall)

    range.each do |obj|
      new_constraint = Yarpler::Models::Constraint.new
      new_constraint.expression = forall.expression.clone
      new_constraint.expression = replace_selector(new_constraint.expression, forall.variable, obj.to_s,
                                                   forall.range)

      constraints << new_constraint if where(forall, obj)
    end
    constraints
  end

  # Processes a where inside a forall loop, which removes unnecessary constraints
  def where(forall, obj)
    do_add = true

    unless forall.where.nil?
      expression = forall.where.clone
      replace_placeholder_string(expression, forall.variable, obj.instance_name)
      bla = evaluate_expression(expression)
      do_add &&= eval(bla)
    end
    do_add
  end

  # Orders the range of a loop
  def order_range(forall)
    range = forall.range

    if forall.order.is_a? Yarpler::Models::Order
      if forall.order.type == 'ASC'
        range.sort! { |a, b| a.get_value(forall.order.field.attribute) <=> b.get_value(forall.order.field.attribute) }
      else
        range.sort! { |a, b| b.get_value(forall.order.field.attribute) <=> a.get_value(forall.order.field.attribute) }
      end
    end
    range
  end

  # Evaluates an expression inside of a forall statement
  def evaluate_expression(expression, eval_string = '')
    if expression.is_a? Yarpler::Models::Expression
      eval_string << evaluate_expression_inner(expression).to_s
    elsif expression.is_a? Yarpler::Models::Field
      obj = @problem.objects[expression.variable].get_value(expression.attribute)
      if (obj.is_a? Yarpler::Models::Relation)
        obj = @problem.objects[obj.to.first.to_s].id
      end
      eval_string << obj.to_s
    elsif expression.is_a? Yarpler::Models::Literal
      eval_string << expression.value.to_s
    else
      fail Yarpler::Exceptions::InvalidWhereExpression.new, 'Where Expression is illegal'
    end
    eval_string
  end

  # Evaluates an inner expression
  def evaluate_expression_inner(expression)
    expression_string = evaluate_expression(expression.left)
    expression_string << ' ' + expression.operator.to_s + ' '
    expression_string << evaluate_expression(expression.right)
    expression_string
  end

  # Processes a range from a field
  def process_field_range(forall)
    forall.range = range_from_field(forall.range)
    process_forall_statement(forall)
  end

  # Internal resolution of a range from a field
  def range_from_field(field)
    if class_exists? field.variable
      range = @problem.get_objects_of_class(field.variable)
    else
      range = @problem.objects[field.variable].get_value(field.attribute).to
    end
    range
  end

  # Replaces placeholders based on a string
  def replace_placeholder_string(expression, variable_old, variable_new)
    if expression.is_a? Yarpler::Models::Expression
      expression.left = replace_placeholder_string(expression.left, variable_old, variable_new)
      expression.right = replace_placeholder_string(expression.right, variable_old, variable_new)
    elsif expression.is_a? Yarpler::Models::Field
      expression.variable = variable_new if expression.variable == variable_old
    end
    expression
  end

  # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  # Replaces a selector based on multiple variables
  def replace_selector(expression, placeholder_variable, real_variable, range)
    if expression.is_a? Yarpler::Models::Expression
      expression.left = replace_selector(expression.left, placeholder_variable, real_variable, range)
      expression.right = replace_selector(expression.right, placeholder_variable, real_variable, range)
    elsif expression.is_a? Yarpler::Models::SumValueFunction
      expression.elements = replace_selector(expression.elements, placeholder_variable, real_variable, range)
      expression.set = replace_selector(expression.set, placeholder_variable, real_variable, range)
      expression.attribute = replace_selector(expression.attribute, placeholder_variable, real_variable, range)
    elsif expression.is_a? Yarpler::Models::Index
      if expression.variable.to_s == placeholder_variable.to_s
        next_value = nil

        i = 0
        range.each do |r|
          i = i.next
          if r.instance_name == real_variable
            next_value = range[i]
            break
          end
        end

        field = Yarpler::Models::Field.new
        field.variable = next_value
        field.attribute = expression.attribute
        expression = field
      end
    elsif expression.is_a? Yarpler::Models::Cardinality
      expression.element = replace_placeholder_string(expression.element, placeholder_variable, real_variable)
    elsif expression.is_a? Yarpler::Models::Forall
      expression.range = replace_selector(expression.range, placeholder_variable, real_variable, range)
      expression.field = replace_selector(expression.field, placeholder_variable, real_variable, range)
      expression.expression = replace_selector(expression.expression, placeholder_variable, real_variable, range)
      expression.where = replace_selector(expression.where, placeholder_variable, real_variable, range)
    elsif expression.is_a? Yarpler::Models::Countall
      expression.range = replace_selector(expression.range, placeholder_variable, real_variable, range)
      if expression.range.is_a? Yarpler::Models::Field
        expression.range = range_from_field(expression.range)
      end
      expression.expression = replace_selector(expression.expression, placeholder_variable, real_variable, range)
    elsif expression.is_a? Yarpler::Models::Field
      expression.variable = real_variable if expression.variable == placeholder_variable
    elsif expression.is_a? Yarpler::Models::Not
      expression.expression = replace_selector(expression.expression, placeholder_variable, real_variable, range)
    elsif field_or_instance?(expression, placeholder_variable)
      expression.variable = real_variable
    elsif count_function?(expression)
      expression.element = replace_selector(expression.element, placeholder_variable, real_variable, range)
    end
    expression
  end
  # rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  # Checks if the expression is a field or an instance
  def field_or_instance?(expression, placeholder_variable)
    is_field = (expression.is_a? Yarpler::Models::Field)
    is_instance = (expression.is_a? Yarpler::Models::Instance)

    is_field_or_instance =  is_field || is_instance
    is_field_or_instance && (expression.variable == placeholder_variable)
  end

  # Checks if the expression is a count function
  def count_function?(expression)
    expression.is_a? Yarpler::Models::CountFunction
  end

  # Checks if the provided string is a class
  def class_exists?(class_name)
    klass = Object.const_get(class_name)
    return klass.is_a?(Class)
  rescue NameError
    return false
  end
end
# rubocop:enable Metrics/ClassLength
