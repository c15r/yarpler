require 'thor'
#require 'yarpler/runner'

module Yarpler
  class CLI < Thor
    class_option :verbose, :type => :boolean

    #desc "hello NAME", "say hello to NAME"
    #def hello(name)
    #  puts "Hello #{name}"
    #  puts "more text" if options[:verbose]
    #end

    desc "display FILE", "Display the complete input file (yai and yad)"
    def display(file)
      yarpler = Yarpler::Runner.new
      yarpler.display(file)
    end

    desc "tree FILE", "Display the AST of the input file"
    def tree(file)
      yarpler = Yarpler::Runner.new
      yarpler.tree(file)
    end

    desc "flat FILE", "Return a flat input file in YARPL"
    def flat(file)
      yarpler = Yarpler::Runner.new
      yarpler.flat(file)
    end

    desc "parse FILE", "Parse input file and convert to MiniZinc"
    def parse(file)
      yarpler = Yarpler::Runner.new
      yarpler.run(file)
    end

  end
end