require 'spec_helper'
require 'mg_tracker/weather'

RSpec.describe MgTracker::Weather do
  context 'barometer data' do
    let(:ws) { instance_double('MgTracker::WeatherService') }
    let(:city_state) do { city: 'Kennesaw', state: 'GA' } end
    let(:weather) { described_class.new(ws, city_state) }

    before :each do
      allow(ws).to receive(:barometer_in).and_return('30.01')
      allow(ws).to receive(:barometer_mb).and_return('1001')
      allow(ws).to receive(:barometer_trend).and_return('+')
      allow(ws).to receive(:city=)
      allow(ws).to receive(:state=)
    end

    it 'returns baro data in inches' do
      expect(weather.barometer_in).to eq('30.01')
    end

    it 'returns baro data in millibars' do
      expect(weather.barometer_mb).to eq('1001')
    end

    it 'returns baro data trend' do
      expect(weather.barometer_trend).to eq('+')
    end
  end
end
