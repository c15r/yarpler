##
# Helper singleton class for Minizinc Translator which helps generating
# unique IDs for arrays
class MinizincHelper
  include Singleton

  # Initializes the array id index
  def initialize
    @array_id = -1
  end

  # Returs the next array index id and increases
  # the index
  #
  # @return [Integer] next array id
  def array_id
    @array_id = @array_id.next
    @array_id
  end
end
