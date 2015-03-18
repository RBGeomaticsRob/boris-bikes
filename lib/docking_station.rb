class DockingStation
  # DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def dock bike
    fail 'Station Full' if full?
    bikes << bike
    nil
  end

  def release_bike
    fail 'No Bikes Available' if empty?
    bikes.pop
  end

  private

  attr_reader :bikes

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end
end
