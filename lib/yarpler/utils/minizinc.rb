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

      def convert(d)

        code = ""
        d.each do |key, var|
          var.get_list_of_attributes
          code<<convert_variables(key, var)
        end
        code
      end

      def convert_variables(name, ressource)
        # MZ: int: id_dienst_frei = 0;
        code=""
        ressource.get_list_of_attributes.each do |a|
          code<< ressource.get_datatype(a) + ": " + name + "_" + a + "=" + ressource.get_value(a) + " \n"
        end
        code
      end

      def print
        puts @cmd
      end

    end
  end
end