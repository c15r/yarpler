require 'yarpler/utils/file_loader'
require 'yarpler/parser'

module Yarpler
  class Runner

    def run(filename)
      file = Yarpler::Utils::FileLoader.new(filename)
      #file.print

      parser = Yarpler::Parser.new(file.get_content)
      parser.print
    end

  end
end