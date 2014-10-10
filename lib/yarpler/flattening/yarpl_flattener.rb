# YARPL Flatttener is responsible to flatten allquantor statements
#
# It's derived from Extensions::Process and must be invoked to generate proper minizinc code
class YarplFlattener < Yarpler::Extensions::Process
  def initialize
    @constraints = []
  end

  def process(problem)
    problem.constraints.each do |constraint|
      process_constraint(constraint)
    end
    problem.constraints = @constraints
    problem
  end

  private

  def process_constraint(constraint)
    if constraint.expression.is_a? Yarpler::Models::Forall
      process_forall_statement(constraint.expression)
    elsif expression.is_a? Yarpler::Models::Expression
      @constraints << constraint
    end
  end

  def process_forall_statement(forall)
    forall.range.each do |obj|
      new_constraint = Yarpler::Models::Constraint.new
      # @TODO Implement Clone Objects on ALL Constrainable items
      new_constraint.expression = forall.expression.clone
      replace_selector_placeholder(new_constraint.expression, forall.variable, obj.to_s)
      @constraints << new_constraint
    end
  end

  def replace_selector_placeholder(expression, placeholder_variable, real_variable)
    if expression.is_a? Yarpler::Models::Expression
      expression.left = replace_selector_placeholder(expression.left, placeholder_variable, real_variable)
      expression.right = replace_selector_placeholder(expression.right, placeholder_variable, real_variable)
    elsif field_or_instance?(expression, placeholder_variable)
      expression.variable = real_variable
    elsif count_function?(expression)
      expression.element = replace_selector_placeholder(expression.element, placeholder_variable, real_variable)
    end
    expression
  end

  def field_or_instance?(expression, placeholder_variable)
    is_field_or_instance = (expression.is_a? Yarpler::Models::Field) || (expression.is_a? Yarpler::Models::Instance)
    is_field_or_instance && (expression.variable == placeholder_variable)
  end

  def count_function?(expression)
    expression.is_a? Yarpler::Models::CountFunction
  end
end
