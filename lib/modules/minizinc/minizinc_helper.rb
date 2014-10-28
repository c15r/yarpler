##
# Helper singleton class for Minizinc Translator which helps generating
# unique IDs for arrays
class MinizincHelper
  include Singleton

  def initialize
    @array_id = -1
  end

  def array_id
    @array_id = @array_id.next
    @array_id
  end
end
