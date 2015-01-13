# Runs a Minizinc file on the bash. It is important to have Minizinc installed
# on the system, otherwise this component will not work.
class MinizincRunner
  attr_reader :output

  # Prints the MiniZinc Output
  def print
    puts @output
  end

  # Runs a MiniZinc problem from a file
  #
  # @param filename [String] path to a minizinc problem file
  # @return [void]
  def run_from_file(filename)
    file = File.new(filename, 'r')
    content = file.read
    file.close
    run(content)
  end

  # Runs a minizinc model from a model object
  #
  # @param model [String] minizinc model
  # @return [void]
  def run(model)
    path = File.join(Dir.pwd, 'wrk.mzn')
    File.open(path, 'wb') { |f| f.write(model) }
    @output = ` bash -c "minizinc #{path} -n 1" `
    check_minizinc_output
  end

  # Checks if the answer of MiniZinc tells about an error
  # or an unsatisfiable problem
  #
  # @return [void]
  def check_minizinc_output
    check_for_unsatifiable(@output)
    check_for_error(@output)
  end

  # Checks if the MiniZinc output is unsatisfiable
  #
  # @param output [String] console output from MiniZinc
  # @return [void]
  def check_for_unsatifiable(output)
    return false unless output.include?('=====UNSATISFIABLE=====')
    Yarpler::Log.instance.error 'Problem is unsatisfiable!'
    abort
  end

  # Checks if there is an error in MiniZinc output
  #
  # @param output [String] console output from MiniZinc
  # @return [void]
  def check_for_error(output)
    return false if output.include?('----------')
    Yarpler::Log.instance.error 'Exception in MiniZinc!'
    abort
  end
end
