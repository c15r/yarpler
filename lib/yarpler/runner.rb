#require 'yarpler/utils/file_loader'
#require 'yarpler/parser'

module Yarpler
  class Runner

    ##
    # Displays the file
    #
    def display(filename)
      file = Yarpler::Utils::FileLoader.new(filename)
      file.print
    end

    ##
    # Displays the AST
    #
    def tree(filename)
      file = Yarpler::Utils::FileLoader.new(filename)
      parser = Yarpler::Parser.new(file.get_content)
      parser.print
      puts "Not implemented yet."
    end

    ##
    # Converts a file to flattened YARPLER code
    #
    def flat(filename)
      puts "Not implemented yet."
    end

    ##
    # Converts a file to MiniZinc
    #
    def run(filename)
      file = Yarpler::Utils::FileLoader.new(filename)
      parser = Yarpler::Parser.new(file.get_content)
      parser.print
      puts "Not implemented yet."
    end
  end
end