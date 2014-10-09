class YarplFlattener < Yarpler::Extensions::Process
  def process(problem)

    constraints = []
    problem.constraints.each do |c|
      current = c.expression
      if current.is_a? Yarpler::Models::Forall
        current.range.each do |obj|
          new_constraint = Yarpler::Models::Constraint.new()
          # @TODO Implement Clone Objects on ALL Constrainable items
          new_constraint.expression = current.expression.clone
          replace_selector_placeholder(new_constraint.expression, current.variable, obj.to_s)
          constraints << new_constraint
        end
      elsif current.is_a? Yarpler::Models::Expression
        constraints << c
      end
    end
    problem.constraints = constraints
    problem
  end

  private

  def replace_selector_placeholder(expression, placeholder_variable, real_variable)
    if expression.is_a? Yarpler::Models::Expression
      expression.left = replace_selector_placeholder(expression.left,placeholder_variable, real_variable)
      expression.right = replace_selector_placeholder(expression.right,placeholder_variable, real_variable)
    elsif expression.is_a? Yarpler::Models::Field
      if (expression.variable == placeholder_variable)
        expression.variable = real_variable
      end
    elsif expression.is_a? Yarpler::Models::Instance
      if (expression.variable == placeholder_variable)
        expression.variable = real_variable
      end
    elsif expression.is_a? Yarpler::Models::CountFunction
      expression.element = replace_selector_placeholder(expression.element, placeholder_variable, real_variable)
    end
    expression
  end
end
