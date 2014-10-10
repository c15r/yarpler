module Yarpler
  module Utils
    ##
    # YARPL File Loader is responsible to read the problem files
    # and create a string out of them
    #
    # YARPL files can be splitted into two different files:
    # * .yad, the yad file contains the model declaration of the problem
    # * .yai, the yai file holds the model instantiation and the constraint
    # declaration
    #
    # It's optional to split the problem into multiple files.
    # You can pack all just in one .yai file.
    class FileLoader
      attr_reader :content

      def initialize(filename)
        @content = ''
        @filename = filename
        load_files
      end

      private

      def load_files
        filename_domain = @filename.sub('.yai', '.yad')
        load_file_to_content(filename_domain)
        load_file_to_content(@filename)
      end

      def load_file_to_content(filename)
        # @TODO Melde Fehler sobald File nicht vorhanden.
        return false if File.file?(filename_domain)
        file = File.new(filename, 'r')
        @content << file.read
        file.close
      end
    end
  end
end
