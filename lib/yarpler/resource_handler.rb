require 'singleton'

module Yarpler
  class ResourceHandler

    include Singleton

    def initialize
      @id = Hash.new
    end

    def next_id(obj)
      @next=-1
      @id.each do |key, val|
        if obj.class.name==key
          @next = val
          break
        end
      end

      @next = @next.next
      @id[obj.class.name] = @next
      @next
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

    def is_referenced(name)
      Object.const_get(name).new.is_referenced
    end

  end
end
