require 'spec_helper'
require 'mg_tracker/weather_service'

RSpec.describe MgTracker::WeatherService do
  context 'barometer data' do
    let(:ws) { MgTracker::WeatherService.new('Kennesaw', 'GA') }
    let(:data) do
      File.read(File.dirname(__FILE__) + '/../fixtures/wunderground_kennesaw_conditions.json')
    end

    before :each do
      stub_request(:get, Regexp.new("http://api.wunderground.com/api/.+/conditions/q/GA/Kennesaw.json")).
        to_return(:status => 200, :body => data, :headers => {"Content-Type": "application/json"})
    end

    it 'returns barometer data in inches' do
      expect(ws.barometer_in).to eq('30.18')
    end

    it 'returns barometer data in millibars' do
      expect(ws.barometer_mb).to eq('1022')
    end

    it 'returns barometer data trend' do
      expect(ws.barometer_trend).to eq('+')
    end

    it 'returns all barometer data in a hash' do
      expect(ws.barometer_data).to eq({
        in: '30.18',
        mb: '1022',
        trend: '+'
      })
    end
  end
end
