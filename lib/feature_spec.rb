require 'docking_station'

station = DockingStation.new

bike = Bike.new
bike.report_broken
station.dock(bike)

# station.release_bike

# station.dock(Bike.new).report_broken

# sets bike to broken