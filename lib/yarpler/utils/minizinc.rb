module Yarpler
  module Utils
    class Minizinc

      FIXNUM_MAX = (2**(0.size * 8 -2) -1)
      FIXNUM_MIN = -(2**(0.size * 8 -2))


      T_CONSTANT = "%s: %s = %s;\n" # int: id_dienst_frei = 0;
      T_INCLUDES = "include \"globals.mzn\";\n"
      T_HEADER = "%% File generated by YARPLER\n"
      T_OUTPUT = ", \"%s=\" , show(%s) , \" \"   "
      T_SET = "set of int: %s = {%s};\n"
      T_VARIABLE = "var %s: %s;\n" # var 0..2: m0t0;
      T_FOOTER = "solve satisfy;" # @TODO: Wird momentan als Hack missbraucht um den kompletten Durchstich zu ermöglichen ;)

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

      def convert(problem)
        @output="output [ \"\" "
        code = T_HEADER
        code << T_INCLUDES
        problem.objects.each do |key, var|
          var.get_list_of_attributes
          code<<convert_attributes(key, var)
        end
        code << @output + "];\n"
        code << T_FOOTER
        code
      end

      def convert_attributes(name, ressource, reference = false)
        code=""
        ressource.get_list_of_attributes.each do |a|
          case ressource.get_variabletype(a)
            when "CONSTANT"
              if reference
                next
              end
              code<< T_CONSTANT % [ressource.get_datatype(a), a + "_" + name, ressource.load(a)]
            when "VARIABLE"
              # @TODO wieder einbauen?
              #if !reference && ressource.is_referenced
              #  next
              #end
              code<< T_VARIABLE % [ressource.load(a), name + "_" + a]
              @output << T_OUTPUT % [name + "_" + a,name + "_" + a]
            when "REFERENCE"
              i = 0
              ressource.get_value(a).each do |r|

                if r.kind_of?(Array)
                  ## Set
                  if constant_range?(r)
                    code << T_VARIABLE % [array_to_constant_range(r), name.to_s+"_"+ a +"_"+i.to_s]
                  else
                    set_name = "SET_"+name.to_s+"_"+ a+"_"+i.to_s
                    code << T_SET % [set_name, array_to_set_range(r)]
                    code << T_VARIABLE % [set_name, name.to_s+"_"+ a +"_"+i.to_s]
                  end
                  @output << T_OUTPUT % [name.to_s+"_"+ a +"_"+i.to_s,name.to_s+"_"+ a +"_"+i.to_s]
                  i=i.next
                else
                  ## Einzelner Eintrag
                  code << convert_attributes(name.to_s+"_"+r.get_instance_name().to_s, r, true )
                end

              end
          end
        end
        code
      end

      def print
        puts @cmd
      end

      def output
        @cmd
      end

      private

      ## Checks if the range is constant (0,1,2) or not (0,1,3)
      def constant_range?(array)
        values = Array.new
        answer = true
        array.each do |o|
          values.push(o.id)
        end
        values.sort

       last_value = nil
        values.each do |v|

          if last_value.nil?
            last_value=v
            next
          end

          if last_value+1==v
            last_value=v
          else
            answer=false
            break
          end
        end
        answer
      end

      def array_to_set_range(array)
        range = ""
        is_first = true
        array.each do |o|
          if not is_first
            range << ", "
          end
          range << o.id.to_s
          is_first = false
        end
        range
      end

      def array_to_constant_range(array)
        min = FIXNUM_MAX
        max = FIXNUM_MIN
        array.each do |o|
          if (min > o.id)
            min = o.id
          end

          if (max < o.id)
            max = o.id
          end
        end
        range=min.to_s+".."+max.to_s
        range
      end

    end
  end
end