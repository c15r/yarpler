module Yarpler
  module Interpreters
    # FieldAccessorInterpreter is responsible for interpreting statements which access fields of objects
    class FieldAccessorInterpreter
      attr_accessor :field

      # Initializes the interpreter
      def initialize(item)
        if item.size == 1
          @field = InstanceInterpreter.new(item).instance
        else
          process_field(item)
        end
      end

      # Loads the provided field
      def process_field(item)
        @field = Yarpler::Models::Field.new
        @field.variable = item[0].to_s
        @field.attribute = item[1].to_s
      end
    end
  end
end
