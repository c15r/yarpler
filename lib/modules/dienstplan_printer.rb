# DienstplanPrinter is a process extension which prints the solution of a solved minizinc problem
class DienstplanPrinter < Yarpler::Extensions::Process

  # Processes a specific Dienstplan model to a pretty layout
  #
  # @param problem [Yarpler::Models::Problem] interpreted yarpl problem
  # @return [Yarpler::Models::Problem] processed yarpl problem
  def process(problem)
    problem.get_objects_of_class('Mitarbeiter').each do |m|
      puts "\n" + m.instance_name
      puts '##############'
      out = ''
      m.tage.to.each do |t|
        out << t.instance_name + ': ' + t.dienst.to.to_s + ', '
      end
      puts out + "\n"
    end
    problem
  end
end
