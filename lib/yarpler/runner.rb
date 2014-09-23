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

      blu = Yarpler::Interpreter::YARPLInterpreter.new(parser.tree)

      test = Object.const_get("Mitarbeiter").new
      test.print


      test.anzahl = 12
      puts test.anzahl
    end
  end
end