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
      # puts " "


      interpreter = Yarpler::Interpreter::YARPLInterpreter.new(parser.tree)
      handler = Yarpler::RessourceHandler.new

      puts interpreter.problem["d1"].class

      # Dynamic Classes handling
      # mitarbeiter = handler.new_object("Mitarbeiter")
      # mitarbeiter.print
      #
      # dienst = handler.new_object("Dienst")
      # dienst.print
      #
      # tag = handler.new_object("Tag")
      # tag.print


      #test.set_value("anzahl", 123)
      #puts test.get_value("anzahl")
      #puts test.anzahl
    end
  end
end