# Just a class to test if the extionsion architecture works
class TestMinimizer < Yarpler::Extensions::Process

  # Processes the problem and does nothing
  #
  # @param problem [Yarpler::Models::Problem] yarpler problem
  def process(problem)
    problem
  end
end
