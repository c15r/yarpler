require 'time'
require 'date'

module Yarpler
  module Interpreters
    # InitialInterpreter processes a YARPL initial block
    # An initial block is used to instantiate classes
    #
    # @attr_reader objects [Yarpler::Models::Resource] instantiated objects
    # @attr_reader constraints [Array<Yarpler::Models::Constraint>] interpreted constraints
    #
    # == YARPL Example
    #
    #   initial { ... }
    #
    class InitialInterpreter
      attr_accessor :objects
      attr_accessor :constraints

      # Initializes the interpreter
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def initialize(tree)
        @objects = {}
        tree_converter(tree)
      end

      # Converts the tree
      #
      # @param tree [ANTLR3::AST::CommonTree] ANTLR tree node
      # @return [void]
      def tree_converter(tree)
        tree.each do |item|
          case item.to_s
            when 'VARIABLE_DECLARATOR'
              interpret_variable(item)
            when 'RELATION_DECLARATION'
              interpret_relation(item)
          end
        end
      end

      private

      # Interprets a variable
      #
      # @param variable [ANTLR3::AST::CommonTree] variable node parsed by ANTLR
      # @return [void]
      def interpret_variable(variable)
        current_name = variable[0].to_s
        new_object = Yarpler::ResourceHandler.instance.new_object(current_name, variable[1][0].to_s)
        @objects[current_name] = new_object
        attribute_reader(variable[1], new_object)
        initialize_relations(new_object)
      end

      # Interprets a relation
      #
      # @param relation [ANTLR3::AST::CommonTree] relation node parsed by ANTLR
      # @return [void]
      def interpret_relation(relation)
        relation_interpreter = RelationInterpreter.new(relation, @objects).relation
        variable = relation_interpreter.from.variable.to_s
        attribute = relation_interpreter.from.attribute.to_s
        @objects[variable].set_value(attribute, relation_interpreter)
      end

      # rubocop:disable Metrics/MethodLength
      # Initializes the relations
      #
      # @param object [Yarpler::Models::Resource] instantiated object
      # @return [void]
      def initialize_relations(object)
        object.list_of_attributes.each do |attribute|
          case object.get_variabletype(attribute.to_s)
            when 'VARIABLE_HASONE'
              class_name = object.get_datatype(attribute.to_s)

              field = Yarpler::Models::Field.new
              field.variable = object.instance_name
              field.attribute = attribute.to_s

              relation = Yarpler::Models::Relation.new
              relation.from = field
              relation.type = 'VARIABLE_HASONE'
              relation.to = get_objects_of_class(class_name)

              object.set_value(attribute.to_s, relation)
          end
        end
      end
      # rubocop:enable Metrics/MethodLength

      # Gets all objects of a class
      #
      # @param class_name [String] class name to get the objects
      # @return [Array<Yarpler::Models::Resource] instantiated objects of the specified class
      def get_objects_of_class(class_name)
        var_array = []
        @objects.each do |_k, v|
          var_array.push(v) if v.class.to_s == class_name.to_s
        end
        var_array
      end

      # rubocop:disable Metrics/MethodLength
      # Reads all attributes
      #
      # @param tree [ANTLR3::AST::CommonTree] attribute tree node parsed by ANTLR
      # @return [void]
      def attribute_reader(tree, current_obj)
        # TODO: REINGENEER
        tree.each do |thing|
          case thing.to_s
            when 'ATTRIBUTE'
              if thing[1].to_s == 'SET'
                current_obj.set_value(thing[0].to_s, SetInterpreter.new(thing[1], objects))
              else
                value = prepare_value(current_obj.get_variabletype(thing[0].to_s), current_obj.get_datatype(thing[0].to_s), thing[1].to_s)
                current_obj.set_value(thing[0].to_s, value)
              end
          end
        end
      end
      # rubocop:enable Metrics/MethodLength

      # Prepares a value for the interpreter
      #
      # @param type [String] type of the attribute
      # @param datatype [String] data type of the attribute
      # @param value [Object] value of the attribute
      # @return [String] processed value
      def prepare_value(type, datatype, value)
        if datatype == 'DATE'
          fail Yarpler::Exceptions::VariableDateNotAllowed.new if type == 'VARIABLE'
          value = Date.parse(value).to_time.to_i
        elsif type == 'VARIABLE' &&  !value.include?('..')
          value = value.to_s + '..' + value.to_s
        end
        value
      end
    end
  end
end
