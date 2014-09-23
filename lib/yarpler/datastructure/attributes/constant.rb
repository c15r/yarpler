module Yarpler
  module Datastructure
    module Attributes
      class Constant < Attribute

        def initialize(name,value)
          @type = AttributeType::CONSTANT
          name(name)
          value(value)
        end

      end
    end
  end
end
