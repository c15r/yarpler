require 'singleton'

module Yarpler
  # Resource Handler is responsible for generating new objects and unique identifiers
  class ResourceHandler
    include Singleton

    # Initializes the resource handler
    def initialize
      @id = {}
    end

    # Offers the next unique id for the ressources
    def next_id(obj)
      current_value = get_current_value(obj.class.name)
      new_value = current_value.next
      @id[obj.class.name] = new_value
      new_value
    end

    # Initializes a new object
    def new_object(definition, name)
      Object.const_get(name).new(definition)
    rescue
      raise Yarpler::Exceptions::ClassNotInModelException, name
    end

    # Gets datatype of an attribute of an object
    def get_datatype(name, attribute)
      Object.const_get(name).new.get_datatype(attribute)
    end

    # Gets variabletype of an attribute of an object
    def get_variabletype(name, attribute)
      Object.const_get(name).new.get_variabletype(attribute)
    end

    # Checks if the object is referenced
    def referenced?(name)
      Object.const_get(name).new.referenced?
    end

    private

    # Gets current value of class
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
