require 'thor'
require 'yarpler/runner'

module Yarpler
  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "hello NAME", "say hello to NAME"
    def hello(name)
      puts "Hello #{name}"
      puts "more text" if options[:verbose]
    end

    desc "parse FILE", "parse yarpler"
    def parse(file)
      yarpler = Yarpler::Runner.new
      yarpler.run(file)
    end

  end
end