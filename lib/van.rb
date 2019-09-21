require_relative 'bike'

class Van
  
  def initialize
    @broken_bikes = []
  end

  def pickup(docking_station)
    broken_bike = docking_station.release_broken_bike
    @broken_bikes << broken_bike
  end
end