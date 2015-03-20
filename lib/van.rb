class Van
  DEFAULT_CAPACITY = 50
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def load(bike)
    fail 'Van Full' if @bikes.length >= capacity
    bikes << bike
    nil
  end

  def release_bike
    fail 'Van Empty' if @bikes.empty?
    bikes.pop
  end

  def release_broken
    fail 'No Broken Bikes' if @bikes.select(&:broken?).length == 0
    bikes.pop
  end

  private

  attr_reader :bikes
end
