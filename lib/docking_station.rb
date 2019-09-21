require_relative 'bike'

class DockingStation
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end 

  def release_bike
    raise "No bike available" if empty?
    @bikes.each do |bike| 
      if bike.working? 
        return @bikes.delete(bike)
      end
    end
    raise "No available working bikes" 
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

  def release_broken_bike
    @bikes.each do |bike|
      unless bike.working?
        return @bikes.delete(bike)
      end
    end
    nil
  end
  
  private

  attr_reader :bikes
  
  def full?
    @bikes.size >= capacity
  end
  
  def empty?
    @bikes.empty?
  end
end