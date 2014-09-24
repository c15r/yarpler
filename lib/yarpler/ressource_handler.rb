require 'singleton'

module Yarpler
  class RessourceHandler

    include Singleton

    def initialize
      @id = -1;
    end

    def next_id
      @id = @id.next
      @id
    end

    def new_object(name)
      Object.const_get(name).new
    end

  end
end
