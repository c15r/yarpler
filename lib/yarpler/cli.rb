require 'thor'

module Yarpler
  class CLI < Thor

    def initialize(*args)
      super
      Yarpler::Log.instance.switch_level(:debug)
      Yarpler::Log.instance.info "Welcome to YARPLER!"
    end

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

    desc "convert FILE", "Parse input file and convert to MiniZinc"
    def convert(file)
      yarpler = Yarpler::Runner.new
      yarpler.convert(file)
    end

    desc "parse FILE", "Parse input file and solve it"
    def parse(file)
      yarpler = Yarpler::Runner.new
      yarpler.run(file)
    end

  end
end