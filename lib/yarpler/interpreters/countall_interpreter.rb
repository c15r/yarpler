module Yarpler
  module Interpreters
    # CountallInterpreter processes a YARPL Allquantor statement
    # and counts items according to the expression
    #
    # @attr_reader countAll [Yarpler::Models::Countall] interpreted countall object
    #
    # == YARPL Example
    #
    #   countAll(...) { ... } == <expression>
    #
    class CountallInterpreter
      attr_reader :countAll
      attr_reader :constraints

      # Initializes the countall interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @param objects [Hash<String, Object>] hash map of all yarpl objects
      # @param parent [Object] parent
      # @return [void]
      def initialize(tree, objects, parent = nil)
        @objects = objects
        @countAll = Yarpler::Models::Countall.new
        @parent = parent
        @where = nil
        @order = nil
        @constraints = nil
        process_countall(tree)
      end

      private

      # Processes the countall
      #
      # @param expression [ANTLR3::AST::CommonTree] countall expression parsed by antlr
      # @return [void]
      def process_countall(expression)
        countall_selector(expression[0])
        if expression[1].to_s == 'FORALL'
          @countAll.expression = ForallInterpreter.new(expression[1], @objects, @countAll).forall
        else
          @countAll.expression = ExpressionInterpreter.new(expression[1], @objects).expression
        end
      end

      # Processes all filters
      #
      # @param expression [ANTLR3::AST::CommonTree] filter expression parsed by antlr
      # @return [void]
      def process_filters(expression)
        return if expression.size <= 2
        expression[2..expression.size].each do |e|
          if e.to_s == 'WHERE'
            @where = ExpressionInterpreter.new(e).expression
          elsif e.to_s == 'ORDER_ASC'
            process_order_asc(e)
          elsif e.to_s == 'ORDER_DESC'
            process_order_desc(e)
          end
        end
      end

      # Processes the order by desc
      #
      # @param e [ANTLR3::AST::CommonTree] desc expression parsed by antlr
      # @return [void]
      def process_order_desc(e)
        @order = Yarpler::Models::Order.new
        @order.field = FieldAccessorInterpreter.new(e[0]).field
        @order.type = 'DESC'
      end

      # Processes the order by asc
      #
      # @param e [ANTLR3::AST::CommonTree] asc expression parsed by antlr
      # @return [void]
      def process_order_asc(e)
        @order = Yarpler::Models::Order.new
        @order.field = FieldAccessorInterpreter.new(e[0]).field
        @order.type = 'ASC'
      end

      # Checks the selector
      #
      # @param expression [ANTLR3::AST::CommonTree] selector expression parsed by antlr
      # @return [void]
      def countall_selector(expression)
        case expression.to_s
          when 'FROM'
            @countAll.range = countall_range_builder(expression[1])
            @countAll.variable = expression[0].to_s
        end
      end

      # Builds the range
      #
      # @param expression [ANTLR3::AST::CommonTree] range expression parsed by antlr
      # @return [void]
      def countall_range_builder(expression)
        range = []
        case expression.to_s
          when 'FIELD_ACCESSOR'
            # Access to all objects of class
            if expression.size == 1 && class_exists?(expression[0].to_s)
              range = get_objects_of_class(expression[0].to_s)
            else
              range = FieldAccessorInterpreter.new(expression).field
            end
        end
        range
      end

      # Checks if the class exists
      #
      # @param class_name [String] name of a class to check
      # @return true if class exists, false otherwise
      def class_exists?(class_name)
        klass = Object.const_get(class_name)
        return klass.is_a?(Class)
      rescue NameError
        return false
      end

      # Gets all object of a class
      #
      # @param class_name [String] name of a class to get
      # @return [Array<Object>] array of objects from a given class
      def get_objects_of_class(class_name)
        var_array = []
        @objects.each do |_k, v|
          var_array.push(v) if (v.class.to_s == class_name.to_s)
        end
        var_array
      end
    end
  end
end
