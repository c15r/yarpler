require 'singleton'

module Yarpler
  # Resource Handler is responsible for generating new objects and unique identifiers
  class ResourceHandler
    include Singleton

    def initialize
      @id = {}
    end

    def next_id(obj)
      current_value = get_current_value(obj.class.name)
      new_value = current_value.next
      @id[obj.class.name] = new_value
      new_value
    end

    def new_object(definition, name)
      Object.const_get(name).new(definition)
    end

    def get_datatype(name, attribute)
      Object.const_get(name).new.get_datatype(attribute)
    end

    def get_variabletype(name, attribute)
      Object.const_get(name).new.get_variabletype(attribute)
    end

    def referenced?(name)
      Object.const_get(name).new.referenced?
    end

    private

    def get_current_value(classname)
      current_value = 0
      @id.each do |key, val|
        if classname == key
          current_value = val
          break
        end
      end
      current_value
    end
  end
end
