require_relative 'bike'

class DockingStation
  attr_accessor :bike
  alias_method :dock, :bike=
  def release_bike
    fail 'No Bikes' unless @bike
    @bike
  end
end
