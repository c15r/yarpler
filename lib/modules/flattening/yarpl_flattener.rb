# YARPL Flatttener is responsible to flatten allquantor statements
#
# It's derived from Extensions::Process and must be invoked to generate proper minizinc code
# rubocop:disable Metrics/ClassLength
class YarplFlattener < Yarpler::Extensions::Process
  def initialize
    @constraints = []
  end

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

    remove_invalid_constraints(problem)
  end

  # remove all invalid constraints
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

  # check if we have other Allquantors inside now
  def allquantors_inside?(problem)
    problem.constraints.each do |constraint|
      return true if constraint.expression.is_a? Yarpler::Models::Forall
    end
    false
  end

  def process_forall_statement(forall)
    if forall.range.is_a?(Array)
      process_array_range(forall)
    elsif forall.range.is_a?(Yarpler::Models::Field)
      process_field_range(forall)
    end
  end

  def process_array_range(forall)
    forall.range.each do |obj|
      new_constraint = Yarpler::Models::Constraint.new
      new_constraint.expression = forall.expression.clone
      new_constraint.expression = replace_selector(new_constraint.expression, forall.variable, obj.to_s,
                                                   forall.range)
      replace_substitute(new_constraint.expression)
      @constraints << new_constraint
    end
  end

  def process_field_range(forall)
    forall.range = range_from_field(forall.range)
    process_forall_statement(forall)
  end

  private

  def range_from_field(field)
    @problem.objects[field.variable].get_value(field.attribute).to
  end

  def process_constraint(constraint)
    if constraint.expression.is_a? Yarpler::Models::Forall
      process_forall_statement(constraint.expression)
    elsif constraint.expression.is_a? Yarpler::Models::Expression
      @constraints << constraint
    end
  end

  def replace_substitute(expression)
    if expression.is_a? Yarpler::Models::Expression
      expression.left = replace_substitute(expression.left)
      expression.right = replace_substitute(expression.right)
    elsif expression.is_a? Yarpler::Models::Field
      expression.variable = replace_substitute(expression.variable)
    elsif expression.is_a? Yarpler::Models::Substitute
      object = Yarpler::Models::Problem.instance.objects[expression.variable.to_s]
      expression = object.get_value(expression.attribute.to_s).to[0].instance_name
    end
    expression
  end

  # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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
    elsif expression.is_a? Yarpler::Models::Forall
      expression.range = replace_selector(expression.range, placeholder_variable, real_variable, range)
      expression.expression = replace_selector(expression.expression, placeholder_variable, real_variable, range)
    elsif expression.is_a? Yarpler::Models::Field
      if expression.variable.is_a? Yarpler::Models::Substitute
        expression.variable = replace_selector(expression.variable, placeholder_variable, real_variable, range)
      elsif expression.variable == placeholder_variable
        expression.variable = real_variable
      end
    elsif field_or_instance?(expression, placeholder_variable)
      expression.variable = real_variable
    elsif count_function?(expression)
      expression.element = replace_selector(expression.element, placeholder_variable, real_variable, range)
    end
    expression
  end
  # rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def field_or_instance?(expression, placeholder_variable)
    is_field = (expression.is_a? Yarpler::Models::Field)
    is_instance = (expression.is_a? Yarpler::Models::Instance)
    is_substitute = (expression.is_a? Yarpler::Models::Substitute)

    is_field_or_instance =  is_field || is_instance || is_substitute
    is_field_or_instance && (expression.variable == placeholder_variable)
  end

  def count_function?(expression)
    expression.is_a? Yarpler::Models::CountFunction
  end
end
# rubocop:enable Metrics/ClassLength
