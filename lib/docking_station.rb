class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Station Full' if full?
    bikes << bike
    nil
  end

  def release_bike
    fail 'No Available Bikes' if empty?
    bikes.pop
  end

  def release_broken
    fail 'No Broken Bikes' if no_broken_bikes?
    bikes.pop
  end

  private

  attr_reader :bikes

  def empty?
    bikes.reject(&:broken?).length == 0
  end

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end

  def no_broken_bikes?
    p bikes
    bikes.select(&:broken?).length == 0
  end
end
