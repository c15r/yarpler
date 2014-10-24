module Yarpler
  class CLI < Thor

    def initialize(*args)
      super
      Yarpler::Log.instance.switch_level(:debug)
    end

    desc 'solve [FILE] [TRANSLATORS]', 'Parse input file and solve it'
    option :display_ast, :type => :boolean, :aliases => :ast
    option :display_model, :type => :boolean, aliases: :model
    option :no_result, :type => :boolean
    def solve(file, *args)
      core = Yarpler::Core.new
      solution = core.solve_from_file(file, args)
      print_result(options, solution)
    end

    private

    def print_result(options, solution)
      printer = Yarpler::Utils::SolutionPrinter.new
      printer.print_ast solution.ast if options[:display_ast]
      printer.print_model solution.model if options[:display_model]
    end

  end
end
