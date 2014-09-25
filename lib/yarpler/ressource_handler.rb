require 'singleton'

module Yarpler
  class RessourceHandler

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

    def new_object(name)
      Object.const_get(name).new
    end

  end
end
