# ExpressionPrinter is a process extension which prints the expressions in a format, that can be interpreted by yUML to
# generate nice looking diagrams
class ExpressionPrinter < Yarpler::Extensions::Process

  attr_reader :id

  # Process the whole problem
  def process(problem)
    @id = 0
    problem.constraints.each do |c|
      puts print_expression(c.expression)
      puts "\n\n"
    end
    problem
  end

  # Print a single expression in yuml syntax
  def print_expression(expression)
    string = ''
    if expression.is_a? Yarpler::Models::Forall
      range = expression.range.to_s
      range=range.tr(",[]", '')
      string << "[#{expression} #{expression.variable} for #{range}]->" + print_expression(expression.expression)
    elsif expression.is_a? Yarpler::Models::Cardinality
      string << "[#{expression}]\n"
      string << "[#{expression}]->" + print_expression(expression.element)
    elsif expression.is_a? Yarpler::Models::Field
      string << "[#{expression} #{expression.variable}.#{expression.attribute}]\n"
    elsif expression.is_a? Yarpler::Models::Literal
      string << "[#{expression} #{expression.value}]\n"
    elsif expression.is_a? Yarpler::Models::Instance
      string << "[#{expression} #{expression.variable}]\n"
    elsif expression.is_a? Yarpler::Models::CountFunction
      string << "[#{expression}} for #{expression.range.variable}.#{expression.range.attribute} ]\n"
      string << "[#{expression}} for #{expression.range.variable}.#{expression.range.attribute} ]--" + print_expression(expression.where)
    elsif expression.is_a? Yarpler::Models::SumValueFunction
      string << "[#{expression}} #{expression.attribute} of #{expression.set.variable}.#{expression.set.attribute} ]\n"
    elsif expression.is_a? Yarpler::Models::Expression
      string << "[#{expression} #{expression.operator}]\n"
      string << "[#{expression} #{expression.operator}]->" + print_expression(expression.left)
      string << "[#{expression} #{expression.operator}]->" + print_expression(expression.right)
    else
      puts expression.class.to_s + ' missing.'
    end
    string
  end
end
