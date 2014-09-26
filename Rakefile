require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "tests"
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end

desc 'Generate yarpl parser and lexer from the grammar'
task :antlr do
  Dir.chdir "lib"
  Dir.chdir "yarpl"
  @cmd = %x( antlr4ruby Yarpl.g )
end