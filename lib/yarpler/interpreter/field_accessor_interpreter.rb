module Yarpler
  module Interpreter
    class FieldAccessorInterpreter
      attr_accessor :field

      def initialize(item)
        if item.size == 1
          @field=InstanceInterpreter.new(item).instance
        else
          process_field(item)
        end
      end

      def process_field(item)
        if item.size == 3
          # @TODO Funktioniert erst mit dreier-Verschachtelung, muss natürlich für alles funktionieren
          @field = Yarpler::Models::Field.new
          @field.variable = Yarpler::Models::Substitute.new
          @field.variable.variable = item[0].to_s
          @field.variable.attribute = item[1].to_s
          @field.attribute = item[item.size-1].to_s
        else
          process_single(item)
        end
      end

      def process_single(item)
        @field = Yarpler::Models::Field.new
        @field.variable = item[0].to_s
        @field.attribute = item[1].to_s
      end
    end
  end
end
