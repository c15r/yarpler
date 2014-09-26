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
    # Converts a file to MiniZinc and solves it
    #
    def run(filename)

      file = Yarpler::Utils::FileLoader.new(filename)
      parser = Yarpler::Parser.new(file.get_content)
      parser.print
      # puts " "


      interpreter = Yarpler::Interpreter::YARPLInterpreter.new(parser.tree)
      d=interpreter.problem
      mz = Yarpler::Utils::Minizinc.new
      minizinc_file = mz.convert(d)
      mz.run(minizinc_file)
      puts minizinc_file
      mz.print
    end

    ##
    # Converts a file to MiniZinc and displays it
    #
    def convert(filename)
      file = Yarpler::Utils::FileLoader.new(filename)
      parser = Yarpler::Parser.new(file.get_content)
      parser.print

      interpreter = Yarpler::Interpreter::YARPLInterpreter.new(parser.tree)
      d=interpreter.problem
      mz = Yarpler::Utils::Minizinc.new
      minizinc_file = mz.convert(d)
      puts minizinc_file

    end
  end
end