module Yarpler
  # Core is the interface to YARPLER
  class Core

    # Solves a YARPL file
    #
    # @param yarpl [String] either a yarpl file or a yarpl problem definition
    # @param extensions [Array<String>] modules to call during the process
    # @return [Solution] solution object with an ast, problem definition and solver output
    def solve(yarpl, extensions)
      problem = yarpl
      if File.file?(problem)
        Yarpler::Log.instance.info "Extracting the problem from file #{problem}"
        problem = read_file(problem)
      end

      Yarpler::Log.instance.info 'Starting to solve the problem'
      solution = Yarpler::Models::Solution.new
      solution.ast = parse_problem_with_antlr(problem)
      solution.model = interpret_ast(solution.ast)
      solution.model = translate_problem(solution.model, extensions)
      solution
    end

    private

    # Reads a file from the file system
    #
    # @param filename [String] path to a yarpl file to load
    # @return [String] yarpl problem definition
    def read_file(filename)
      loader = Yarpler::Utils::FileLoader.new
      loader.load_files(filename)
    end

    # Parses the problem with help of ANTLR library
    #
    # @param problem [Problem] a yarpl problem containing a problem definition
    # @return [Object] an antlr ast object
    def parse_problem_with_antlr(problem)
      antlr_parser = Yarpler::Parser.new
      antlr_parser.parse(problem)
    end

    # Interprets the AST and creates a YARPL data structure out of it
    #
    # @param antlr_ast [ANTR3::AST::CommonTree] the complete AST
    # @return [Problem] internal datastructure of the interpreted problem
    def interpret_ast(antlr_ast)
      interpreter = Yarpler::Interpreter.new
      interpreter.interpret(antlr_ast)
    end

    # Translates the problem to a solver problem
    #
    # @param problem [Problem] internal datastructure, interpreted problem
    # @param extensions [Array<String>] list of modules to call
    # @return [Problem] internal datastructure of the interpreted problem
    def translate_problem(problem, extensions)
      extensions.each do |a|
        class_name = a.to_s
        unless class_exists?(class_name)
          Yarpler::Log.instance.error class_name + ' is not located in the lib folder.'
          abort
        end
        problem = run_extension(class_name, problem)
      end
      problem
    end

    # Checks if a class exist by string
    #
    # @param class_name [String] name of a class
    # @return [Boolean] returns true if the class exists, false otherwise
    def class_exists?(class_name)
      class_object = Object.const_get(class_name)
      return class_object.is_a?(Class)
    rescue NameError
      return false
    end

    # Runs one extension
    #
    # @param class_name [String] class name of the module to run
    # @param problem [Problem] internal datastructure of the yarpl problem
    # @return [Problem] processed problem definition
    def run_extension(class_name, problem)
      extension = Object.const_get(class_name).new

      if extension.is_a?(Yarpler::Extensions::Translator)
        problem = run_translator(extension, problem)
      elsif extension.is_a?(Yarpler::Extensions::Process)
        problem = run_processor(extension, problem)
      else
        Yarpler::Log.instance.error class_name + ' is not inherited by a supported superclass.'
        abort
      end
      problem
    end

    # Runs a translator
    #
    # @param extension [Object] translator to run
    # @param problem [Problem] internal datastructure of the yarpl problem
    # @return [Problem] processed problem definition
    def run_translator(extension, problem)
      Yarpler::Log.instance.info 'Run translator ' + extension.class.to_s
      problem = extension.before_translate(problem)
      extension.translate(problem)
      extension.after_translate(problem)
    end

    # Runs a processor
    #
    # @param processor [Object] processor to run
    # @param problem [Problem] internal datastructure of the yarpl problem
    # @return [Problem] processed problem definition
    def run_processor(processor, problem)
      Yarpler::Log.instance.info 'Run process ' + processor.class.to_s
      processor.process problem
    end
  end
end
