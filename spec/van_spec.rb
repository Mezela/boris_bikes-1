require 'van'

describe Van do
  describe '#pickup' do
    it 'picks up broken bikes' do
      bike = Bike.new
      bike.report_broken
      docking_station = DockingStation.new
      docking_station.dock(bike)
      expect(subject.pickup(docking_station)).to eq [bike]
    end
  end

  describe '#deliver' do
    it 'delivers broken bikes to garages' do
    end
  end
end