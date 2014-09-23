module Yarpler
  module Datastructure
    module Attributes
      class Variable < Attribute

        def initialize(name,value)
          @type = AttributeType::VARIABLE
          name(name)
          value(value)
        end

      end
    end
  end
end