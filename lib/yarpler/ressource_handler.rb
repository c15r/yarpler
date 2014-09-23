module Yarpler
  class RessourceHandler

    def new_object(name)
      Object.const_get(name).new
    end

  end
end
