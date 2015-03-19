class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No Bikes' if empty?
    bikes.pop
  end

  def dock(bike)
    fail 'Station Full' if full?
    bikes << bike
    nil
  end

  private

  attr_reader :bikes

  def empty?
    bikes.reject(&:broken?).length == 0
  end

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end
end
