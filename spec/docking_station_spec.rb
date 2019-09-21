require 'docking_station'

describe DockingStation do
    # it { is_expected.to respond_to(:release_bike) }
    # it { is_expected.to respond_to(:bikes) }
    # it { is_expected.to respond_to(:dock).with(1).argument }
    let(:bike) {double :bike}
    
    it 'releases a working bike' do
        allow(bike).to receive(:working?).and_return(true)
        # shorthand version of method stub
        # bike = double("bike", :working? => true)
        subject.dock(bike)
        expect(subject.release_bike).to be_working
    end

    describe 'initialization' do
        it 'defaults to 20 bikes if no capacity is given' do
          expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
        end
    
        it 'has variable capacity based on user input' do
          station = DockingStation.new(35)
          35.times{station.dock(double(:bike))}
          expect{station.dock(double(:bike))}.to raise_error("Docking station is full")
        end
      end


    describe '#dock' do
        
        it 'docks something' do
            allow(bike).to receive(:working?).and_return(true)
            station = DockingStation.new
            station.dock(bike)
            expect(station.release_bike).to eq bike
        end

        it ' raises error if dock is full' do
            # setup
            station = DockingStation.new
            num = DockingStation::DEFAULT_CAPACITY
            num.times{station.dock(double(:bike))}
           expect{station.dock(bike)}.to raise_error("Docking station is full")
        end
    end

    describe '#release_bike' do
        it 'release a bike' do
            allow(bike).to receive(:working?).and_return(true)
            # setup
            subject.dock(bike)

            # execute
            released_bike = subject.release_bike

            # assert
            expect(released_bike).to eq bike
        end

        it 'raise error if no bike docked' do
            expect{subject.release_bike}.to raise_error("No bike available")
        end

        it "doesn't release a broken bike" do
            allow(bike).to receive(:working?).and_return(false)
            allow(bike).to receive(:report_broken).and_return(true)
            bike.report_broken
            subject.dock(bike)
            expect{subject.release_bike}.to raise_error("No available working bikes")
        end
        
        it 'docks a bike whether its broken or not' do
            allow(bike).to receive(:report_broken).and_return(true)
            bike.report_broken
            expect(subject.dock(bike)).to eq [bike]
        end
        
    end
    
    describe '#release_broken_bike' do
        it 'releases a broken bike' do
            allow(bike).to receive(:report_broken).and_return(true)
            allow(bike).to receive(:working?).and_return(false)
            bike.report_broken
            subject.dock(bike)
            expect(subject.release_broken_bike).to eq bike
        end
        it "doesn't release working bikes" do
            allow(bike).to receive(:working?).and_return(true)
            subject.dock(bike)
            expect(subject.release_broken_bike).to eq nil
        end 
    end
end