class Van
  DEFAULT_CAPACITY = 50
  def initialize
    @bikes = []
  end

  def load(bike)
    fail 'Van Full' if @bikes.length >= DEFAULT_CAPACITY
    @bikes << bike
  end
end
