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
      d=interpreter.problem
      mz = Yarpler::Utils::Minizinc.new
      minizinc_file = mz.convert(d)

      puts "###############"
      puts ".mzn"
      puts "###############"
      puts minizinc_file

      mz.run(minizinc_file)

      puts "###############"
      puts "MiniZinc Output"
      puts "###############"
      mz.print

    end
  end
end