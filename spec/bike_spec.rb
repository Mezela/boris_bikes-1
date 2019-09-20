require 'bike'


describe Bike do
  it { is_expected.to respond_to(:working?) }

  describe '#report broken' do
    it 'reports a bike as broken' do
      expect((Bike.new).report_broken).to eq true
    end

    it 'checks whether state of bike updates to broken after reporting it' do
      subject.report_broken
      expect(subject.working?).to eq false
    end

    

  end
end