module Yarpler
  # Utilization module for all the things that
  # are used but not really connected to anything
  # specific.
  module Utils
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

      # Initializes the file loader
      def initialize
      end

      # Loads files based on a file name and combines
      # split up instance and domain files
      #
      # @param filename [String] path to a yarpl file
      # @return [String] content of the yarpl file (merged yai and yad)
      def load_files(filename)
        filename_domain = filename.sub('.yai', '.yad')

        content = ''
        content << load_file_to_content(filename_domain)
        content << load_file_to_content(filename)
      end

      private

      # Loads the content from file system
      #
      # @param filename [String] path to a yarpl file
      # @return [String] content of the yarpl file
      def load_file_to_content(filename)
        # @TODO Melde Fehler sobald File nicht vorhanden.
        return '' unless File.file?(filename)

        content = ''
        file = File.new(filename, 'r')
        content << file.read
        file.close

        content
      end
    end
  end
end
