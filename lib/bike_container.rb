module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_writer :capacity
  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
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

  def release_broken
    fail 'No Broken Bikes' if no_broken_bikes?
    bikes.pop
  end

  private

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.reject(&:broken?).length == 0
  end

  def no_broken_bikes?
    p bikes
    bikes.select(&:broken?).length == 0
  end
end
