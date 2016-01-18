require 'spec_helper'
require 'mg_tracker/barometer'

RSpec.describe MgTracker::Barometer do
  let(:weather) { instance_double 'MgTracker::Weather' }
  let(:barometer) { MgTracker::Barometer.new(weather: weather, city: 'Kennesaw', state: 'GA') }

  before :each do
    allow(weather).to receive(:city=)
    allow(weather).to receive(:state=)
  end

  it 'returns the barometer reading in inches' do
    allow(weather).to receive(:barometer_in).and_return('30.01')
    expect(barometer.inches).to eq('30.01')
  end

  it 'returns the barometer reading in millibars' do
    allow(weather).to receive(:barometer_mb).and_return('1001')
    expect(barometer.mb).to eq('1001')
  end

  it 'returns the barometer trend' do
    allow(weather).to receive(:barometer_trend).and_return('+')
    expect(barometer.trend).to eq('+')
  end
end
