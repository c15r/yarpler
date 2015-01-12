require 'singleton'

module Yarpler
  # Resource Handler is responsible for generating new objects and unique identifiers
  #
  # @singleton
  class ResourceHandler
    include Singleton

    # Initializes the resource handler
    def initialize
      @id = {}
    end

    # Offers the next unique id for the ressources
    #
    # @param obj [Object] object to get an id for
    # @return [Integer] next id for a given object type (simple increment)
    def next_id(obj)
      current_value = get_current_value(obj.class.name)
      new_value = current_value.next
      @id[obj.class.name] = new_value
      new_value
    end

    # Initializes a new object
    #
    # @param definition [Object] object definition
    # @param name [String] name of the class to instantiate
    # @return [Object] new object
    # @raise [ClassNotInModelException] if the class to instantiate could not be found
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
    #
    # @param name [Object] object which the attribute belongs to
    # @param attribute [String] attribute name to get the type from
    # @return [String] attribute type
    def get_variabletype(name, attribute)
      Object.const_get(name).new.get_variabletype(attribute)
    end

    # Checks if the object is referenced
    #
    # @param name [Object] object to check
    # @return [Boolean] true if the object is referenced, false otherwise
    def referenced?(name)
      Object.const_get(name).new.referenced?
    end

    private

    # Gets current value of class
    #
    # @param classname [String] name of the class
    # @return [Integer] current value of a class
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
