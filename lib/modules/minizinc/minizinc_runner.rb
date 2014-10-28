# Runs a Minizinc file on the bash. It is important to have Minizinc installed
# on the system, otherwise this component will not work.
class MinizincRunner
  attr_reader :output

  def print
    puts @output
  end

  def run_from_file(filename)
    file = File.new(filename, 'r')
    content = file.read
    file.close
    run(content)
  end

  def run(model)
    path = File.join(Dir.pwd, 'wrk.mzn')
    File.open(path, 'wb') { |f| f.write(model) }
    @output = ` bash -c "minizinc #{path} -n 1" `
    check_minizinc_output
  end

  def check_minizinc_output
    check_for_unsatifiable(@output)
    check_for_error(@output)
  end

  def check_for_unsatifiable(output)
    return false unless output.include?('=====UNSATISFIABLE=====')
    Yarpler::Log.instance.error 'Problem is unsatisfiable!'
    abort
  end

  def check_for_error(output)
    return false if output.include?('----------')
    Yarpler::Log.instance.error 'Exception in MiniZinc!'
    abort
  end
end
