require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "tests"
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end

desc 'Generate yarpl parser and lexer from the grammar'
task :antlr do
  puts 'generating yarpl parser'
  Dir.chdir 'lib/yarpl'
  @cmd = %x( antlr4ruby Yarpl.g )

  puts 'generating yarpler output parser'
  Dir.chdir '../../modules/minizinc/yarpler_output/'
  @cmd = %x( antlr4ruby YarplerOutput.g )

  puts 'done!'
end