# YARPL Flatttener is responsible to flatten allquantor statements
#
# It's derived from Extensions::Process and must be invoked to generate proper minizinc code
class YarplFlattener < Yarpler::Extensions::Process
  def initialize
    @constraints = []
  end

  def process(problem)
    @problem = problem
    godeeper = false
    problem.constraints.each do |constraint|
      process_constraint(constraint)
    end
    problem.constraints = @constraints

    # check if we have other Allquantors inside now
    problem.constraints.each do |constraint|
      if constraint.expression.is_a? Yarpler::Models::Forall
        godeeper = true
      end
    end

    if godeeper
      @constraints = []
      problem = YarplFlattener.new.process(problem)
    end


    # remove all invalid constraints
    invalid=[]
    problem.constraints.each do |constraint|
      if not constraint.is_valid?
        invalid<<constraint
      end
    end

    invalid.each do |i|
      problem.constraints.delete(i)
    end


    problem
  end

  def process_forall_statement(forall)
    if forall.range.is_a?(Array)
      forall.range.each do |obj|
        new_constraint = Yarpler::Models::Constraint.new
        new_constraint.expression = forall.expression.clone
        new_constraint.expression = replace_selector_placeholder(new_constraint.expression, forall.variable, obj.to_s, forall.range)
        replace_substitute(new_constraint.expression)
        @constraints << new_constraint
      end
    elsif forall.range.is_a?(Yarpler::Models::Field)
      forall.range = range_from_field(forall.range)
      process_forall_statement(forall)
    end

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
      expression=Yarpler::Models::Problem.instance.objects[expression.variable.to_s].get_value(expression.attribute.to_s).to[0].get_instance_name
    end
    expression
  end

  def replace_selector_placeholder(expression, placeholder_variable, real_variable, range)
    if expression.is_a? Yarpler::Models::Expression
      expression.left = replace_selector_placeholder(expression.left, placeholder_variable, real_variable,range)
      expression.right = replace_selector_placeholder(expression.right, placeholder_variable, real_variable,range)
    elsif expression.is_a? Yarpler::Models::Index
      if expression.variable.to_s == placeholder_variable.to_s
        next_value = nil

        i=0
        range.each do |r|
          i=i.next
          if r.get_instance_name == real_variable
            next_value=range[i]
            break
          end
        end

        field=Yarpler::Models::Field.new
        field.variable =next_value
        field.attribute=expression.attribute
        expression = field
      end
    elsif expression.is_a? Yarpler::Models::Forall
      expression.range = replace_selector_placeholder(expression.range, placeholder_variable, real_variable,range)
      expression.expression = replace_selector_placeholder(expression.expression, placeholder_variable, real_variable,range)
    elsif expression.is_a? Yarpler::Models::Field
      if expression.variable.is_a? Yarpler::Models::Substitute
        expression.variable = replace_selector_placeholder(expression.variable, placeholder_variable, real_variable,range)
      elsif expression.variable == placeholder_variable
        expression.variable=real_variable
      end
    elsif field_or_instance?(expression, placeholder_variable)
      expression.variable = real_variable
    elsif count_function?(expression)
      expression.element = replace_selector_placeholder(expression.element, placeholder_variable, real_variable,range)
    end
    expression
  end

  def field_or_instance?(expression, placeholder_variable)
    is_field_or_instance = (expression.is_a? Yarpler::Models::Field) || (expression.is_a? Yarpler::Models::Instance) || (expression.is_a? Yarpler::Models::Substitute)
    is_field_or_instance && (expression.variable == placeholder_variable)
  end

  def count_function?(expression)
    expression.is_a? Yarpler::Models::CountFunction
  end
end
