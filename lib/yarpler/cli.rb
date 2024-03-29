module Yarpler
  # Command Line Interface of YARPLER
  # CLI is responsible for handling the logic for the user interaction
  # It uses the Thor library to build the interface
  class CLI < Thor

    # Initializes the Interface
    def initialize(*args)
      super
      Yarpler::Log.instance.switch_level(:debug)
    end


    desc 'solve [FILE] [TRANSLATORS]', 'Parse input file and solve it'
    option :display_ast, type: :boolean, aliases: :ast
    option :display_model, type: :boolean, aliases: :model
    option :no_result, type: :boolean
    # Solves a YARPL file
    #
    # @param file [String] path to a file which should be solved
    # @param [Array<String>] args the arguments passed from input
    # @return [void]
    def solve(file, *args)
      core = Yarpler::Core.new
      solution = core.solve(file, args)
      print_result(options, solution)
    end

    private

    # Prints the result of the process to CLI
    #
    # @param options [Array<String>] Options for yarpler what to display
    # @return [void]
    def print_result(options, solution)
      printer = Yarpler::Utils::SolutionPrinter.new
      printer.print_ast solution.ast if options[:display_ast]
      printer.print_model solution.model if options[:display_model]
    end
  end
end
