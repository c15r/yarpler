module Yarpler
  module Interpreter
    class FieldAccessorInterpreter
      attr_accessor :field

      def initialize(item)
        if item.size == 1
          InstanceInterpreter.new(item).instance
        else
          process_field(item)
        end
      end

      def process_field(item)
        # @TODO solve verschachtelte Fields
        @field = Yarpler::Models::Field.new
        @field.variable = item[0].to_s
        @field.attribute = item[1].to_s
      end
    end
  end
end
