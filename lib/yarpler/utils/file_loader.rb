module Yarpler
  module Utils
    class FileLoader
      def initialize(filename)
        @contents = ''
        @filename = filename
        load_files
      end

      def get_content
        @contents
      end

      private

      def load_files
        filename_domain = @filename.sub('.yai', '.yad')
        if File.file?(@filename) # @TODO Melde Fehler sobald File nicht vorhanden.
          if File.file?(filename_domain)
            load_file_to_contents(filename_domain)
          end
          load_file_to_contents(@filename)
        end
      end

      def load_file_to_contents(filename)
        file = File.new(filename, 'r')
        @contents << file.read
        file.close
      end
    end
  end
end
