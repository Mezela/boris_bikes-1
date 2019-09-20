require 'docking_station'

describe DockingStation do
    # it { is_expected.to respond_to(:release_bike) }
    # it { is_expected.to respond_to(:bikes) }
    # it { is_expected.to respond_to(:dock).with(1).argument }

    it 'releases a working bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to be_working
    end

    describe 'initialization' do
        it 'defaults to 20 bikes if no capacity is given' do
          expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
        end
    
        it 'has variable capacity based on user input' do
          station = DockingStation.new(35)
          35.times{station.dock(Bike.new)}
          expect{station.dock(Bike.new)}.to raise_error("Docking station is full")
        end
      end


    describe '#dock' do
        
        it 'docks something' do
            my_bike = Bike.new
            station = DockingStation.new
            station.dock(my_bike)
            expect(station.release_bike).to eq my_bike
        end

        it ' raises error if dock is full' do
            # setup
            station = DockingStation.new
            num = DockingStation::DEFAULT_CAPACITY
            num.times{station.dock(Bike.new)}
            my_bike = Bike.new
            
           expect{station.dock(my_bike)}.to raise_error("Docking station is full")
        end
    end

    describe '#release_bike' do
        it 'release a bike' do
            # setup
            my_bike = Bike.new
            subject.dock(my_bike)

            # execute
            released_bike = subject.release_bike

            # assert
            expect(released_bike).to eq my_bike
        end

        it 'raise error if no bike docked' do
            expect{subject.release_bike}.to raise_error("No bike available")
        end

        it "doesn't release a broken bike" do
            bike = Bike.new
            bike.report_broken
            subject.dock(bike)
            expect{subject.release_bike}.to raise_error("No available working bikes")
        end

        it 'docks a bike whether its broken or not' do
            bike = Bike.new
            bike.report_broken
            expect(subject.dock(bike)).to eq [bike]
        end

    end

end