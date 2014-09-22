module Yarpler
  module Utils
    class Minizinc

      def run_from_file(filename)
        file = File.new(filename, "r")
        content = file.read
        file.close
        run(content)
      end

      def run(model)
        path = 'wrk.mzn'
        File.open(path, "wb") { |f| f.write(model) }
        @cmd = %x( minizinc #{path} )
      end

      def print
        puts @cmd
      end

    end
  end
end