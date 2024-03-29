require_relative 'yarpler_output/YarplerOutputLexer'
require_relative 'yarpler_output/YarplerOutputParser'

# MiniZinc Output Parser
# Reads the return value of the minizinc solver and updates the YARPL data structure
#
# @attr_reader tree [ANTLR3::AST::CommonTree] ANTLR Tree of output parsing
# @attr_reader problem [Yarpler::Models::Problem] interpreted yarpl problem
#
# rubocop:disable Metrics/MethodLength
class OutputParser

  # ANTLR Tree of output parsing
  attr_reader :tree

  # Object with problem definition
  attr_reader :problem

  # Initializes the parser
  #
  # @param output [ANTLR3::AST::CommonTree] ANTLR Tree of output parsing
  # @param problem [Yarpler::Models::Problem] interpreted yarpl problem
  # @return [void]
  def initialize(output, problem)
    @output = output
    parse
    fill_output(@tree, problem)
    @problem = problem
  end

  private

  # Fills the output back into the problem object
  #
  # @param tree [ANTLR3::AST::CommonTree] ANTLR tree of the output
  # @param problem [Yarpler::Models::Problem] interpreted yarpl problem
  # @return [void]
  def fill_output(tree, problem)
    tree.each do |t|
      if t.to_s == 'OUTPUT'
        if t.size == 2
          read_variable(t[0].to_s, t[1].to_s, problem)
        else
          read_variable_list(t[0].to_s, t[1..t.size], problem)
        end
      else
        fill_output(t, problem)
      end
    end
  end

  # Gets a list of all variables
  #
  # @param var [String] variable name to derive the instance name
  # @param values [Hash<String, String>] fields
  # @param problem [Yarpler::Models::Problem] interpreted yarpl problem
  # @return [void]
  def read_variable_list(var, values, problem)
    instance_name = var.slice(0..(var.index('_') - 1))
    field_name = var[var.index('_') + 1..var.length]

    # Guard Clasue
    return false unless (problem.objects[instance_name].get_variabletype(field_name) == 'VARIABLE_HASMANY')

    datatype = problem.objects[instance_name].get_datatype(field_name)

    relation = problem.objects[instance_name].get_value(field_name)
    relation.to.clear

    values = rewrite_range(values)

    values.each do |val|
      problem.objects.each do | _k, v|
        next unless (v.class.to_s == datatype.to_s) && (v.id.to_s == val.to_s)
        relation.to << v
        break
      end
    end
    problem.objects[instance_name].set_value(field_name, relation)
  end

  # Restructures the continuous ranges into an array of all values
  #
  # @param values [Array<String>] range to rewrite
  # @return [Array<String>] array of all values
  def rewrite_range(values)
    if values.size == 3 and values[1].to_s == '..'
      new_values = Array.new
      for i in values[0].to_s.to_i..values[2].to_s.to_i
        new_values.push(i.to_s)
      end
      values = new_values
    end
    values
  end

  # Read a single variable
  #
  # @param var [String] variable name
  # @param val [Object] value
  # @param problem [Yarpler::Models::Problem] interpreted yarpl problem
  # @return [void]
  def read_variable(var, val, problem)
    instance_name = var.slice(0..(var.index('_') - 1))
    field_name = var[var.index('_') + 1..var.length]
    arr = field_name.split('_')

    if problem.objects[instance_name].get_variabletype(field_name) == 'VARIABLE_HASONE'
      datatype = problem.objects[instance_name].get_datatype(field_name)
      problem.objects.each do |_k,v|
        next unless (v.class.to_s == datatype.to_s) && (v.id.to_s == val.to_s)
        relation = problem.objects[instance_name].get_value(field_name)
        relation.to.clear
        relation.to << v
        problem.objects[instance_name].set_value(field_name, relation)
        break
      end
    else
      field_name = arr[0]
      problem.objects[instance_name].set_value(field_name, val)
    end
  end

  # Parse the problem output
  #
  # @return [void]
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
# rubocop:enable Metrics/MethodLength
