module Yarpler
  # Core is the interface to YARPLER
  class Core

    # Solves a YARPL file
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
    def read_file(filename)
      loader = Yarpler::Utils::FileLoader.new
      loader.load_files(filename)
    end

    # Parses the problem with help of ANTLR library
    def parse_problem_with_antlr(problem)
      antlr_parser = Yarpler::Parser.new
      antlr_parser.parse(problem)
    end

    # Interprets the AST and creates a YARPL data structure out of it
    #
    # @param antlr_ast [ANTR3::AST::CommonTree] the complete AST
    def interpret_ast(antlr_ast)
      interpreter = Yarpler::Interpreter.new
      interpreter.interpret(antlr_ast)
    end

    # Translates the problem to a solver problem
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
    def class_exists?(class_name)
      class_object = Object.const_get(class_name)
      return class_object.is_a?(Class)
    rescue NameError
      return false
    end

    # Runs one extension
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
    def run_translator(extension, problem)
      Yarpler::Log.instance.info 'Run translator ' + extension.class.to_s
      problem = extension.before_translate(problem)
      extension.translate(problem)
      extension.after_translate(problem)
    end

    # Runs a processor
    def run_processor(processor, problem)
      Yarpler::Log.instance.info 'Run process ' + processor.class.to_s
      processor.process problem
    end
  end
end
