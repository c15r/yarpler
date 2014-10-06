class MinizincHelper
  include Singleton

  def initialize
    @array_id = -1
  end

  def get_array_id
    @array_id = @array_id.next
    @array_id
  end
end
