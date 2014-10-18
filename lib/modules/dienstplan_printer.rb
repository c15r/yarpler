class DienstplanPrinter < Yarpler::Extensions::Process
  def process(_problem)
    _problem.get_objects_of_class('Mitarbeiter').each do |m|
      puts "\n" + m.get_instance_name + " - " + m.differenz
      puts '##############'
      out = ''
      m.tage.to.each do |t|
        out << t.get_instance_name + ': ' + t.dienst.to.to_s + ', '

      end
      puts out + "\n"
    end
    _problem
  end
end