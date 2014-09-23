module Yarpler
  module Interpreter
    class ClassInterpreter

      def initialize(tree)
        @res = Ressource.new(tree[0].to_s)
        @res.print
      end

    end
  end
end
