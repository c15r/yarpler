module Yarpler
  module Utils
    class MinizincRunner

      def print
        puts @cmd
      end

      def output
        @cmd
      end

      def run_from_file(filename)
        file = File.new(filename, "r")
        content = file.read
        file.close
        run(content)
      end

      def run(model)
        path = File.join(Dir.pwd, 'wrk.mzn')
        File.open(path, "wb") { |f| f.write(model) }
        @cmd = %x( bash -c "minizinc #{path}" )
      end
    end
  end
end