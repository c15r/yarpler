require 'rake/testtask'
# require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.libs = %w(lib tests)
  t.verbose = true
  t.test_files = FileList['tests/unit/test*.rb']
end

Rake::TestTask.new('test:integration') do |t|
  t.libs = %w(lib tests)
  t.verbose = true
  t.test_files = FileList['tests/integration/test*.rb']
end

Rake::TestTask.new('test:all') do |t|
  t.libs = %w(lib tests)
  t.verbose = true
  t.test_files = FileList['tests/**/test*.rb']
end

desc 'Generate yarpl parser and lexer from the grammar'
task :antlr do
  puts 'generating yarpl parser'
  Dir.chdir 'lib/yarpl'
  @cmd = ` antlr4ruby Yarpl.g `

  puts 'generating yarpler output parser'
  Dir.chdir '../modules/minizinc/yarpler_output/'
  @cmd = ` antlr4ruby YarplerOutput.g `

  puts 'done!'
end

task :integration_test do
  require 'open3'
  number_of_errors = 0
  Dir['data/problems/*.yai'].each do |problem|
    cmd = "bin/yarpler solve #{problem} YarplFlattener MinizincTranslator"
    Open3.popen3(cmd) do |_stdin, _stdout, _stderr, wait_thr|
      message = 'ok'
      unless wait_thr.value.to_s.include? 'exit 0'
        message = 'ERROR!'
        number_of_errors = number_of_errors.next
      end
      puts problem + ': ' + message
    end
  end
  if number_of_errors == 0
    puts 'Congratulations, everything works!'
  else
    puts "Oops, there are #{number_of_errors} errors! Please fix them!"
  end

end

# desc 'Run RuboCop'
# RuboCop::RakeTask.new(:rubocop) do |task|
#  # task.patterns = ['lib/**/*.rb']
#  # don't abort rake on failure
#  task.fail_on_error = false
# end
