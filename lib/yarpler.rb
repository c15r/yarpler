
require 'logging'
require 'thor'

require 'yarpl/YarplLexer'
require 'yarpl/YarplParser'

require 'yarpler/core'
require 'yarpler/cli'
require 'yarpler/log'
require 'yarpler/parser'
require 'yarpler/interpreter'
require 'yarpler/resource_handler'
require 'yarpler/runner'

require 'yarpler/utils/file_loader'

require 'yarpler/extensions/process'
require 'yarpler/extensions/translator'

require 'yarpler/flattening/yarpl_flattener'

require 'yarpler/interpreters/class_interpreter'
require 'yarpler/interpreters/constraint_interpreter'
require 'yarpler/interpreters/expression_interpreter'
require 'yarpler/interpreters/field_accessor_interpreter'
require 'yarpler/interpreters/forall_interpreter'
require 'yarpler/interpreters/function_interpreter'
require 'yarpler/interpreters/initial_interpreter'
require 'yarpler/interpreters/instance_interpreter'
require 'yarpler/interpreters/literal_interpreter'
require 'yarpler/interpreters/model_interpreter'
require 'yarpler/interpreters/solve_interpreter'
require 'yarpler/interpreters/yarpl_interpreter'

require 'yarpler/models/function'
require 'yarpler/models/constraint'
require 'yarpler/models/count_function'
require 'yarpler/models/expression'
require 'yarpler/models/field'
require 'yarpler/models/forall'
require 'yarpler/models/instance'
require 'yarpler/models/literal'
require 'yarpler/models/operator'
require 'yarpler/models/problem'
require 'yarpler/models/relation'
require 'yarpler/models/resource'
require 'yarpler/models/solve_instruction'
require 'yarpler/models/substitute'
require 'yarpler/models/sum_function'
require 'yarpler/models/sum_value_function'

module Yarpler
  def self.hi(n = 'Default Name')
    n
  end
end
