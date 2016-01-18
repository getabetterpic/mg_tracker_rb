require 'httparty'
require 'yaml'

module MgTracker
  # `WeatherService` connects to the weather service to make various weather data available.
  class WeatherService
    attr_accessor :city, :state
    attr_reader :data, :api_key

    def initialize(city = 'Kennesaw', state = 'GA')
      @city = city
      @state = state
      @api_key = YAML.load_file(Dir.pwd + '/config/ws_api_key.yml')['WS_API_KEY']
      url = "http://api.wunderground.com/api/#{api_key}/conditions/q/#{state}/#{city}.json"
      @data = ::HTTParty.get(url)
      @current_observation = @data['current_observation']
    end

    %w(in mb trend).each do |parameter|
      define_method("barometer_#{parameter}") do
        @current_observation["pressure_#{parameter}"]
      end
    end

    def barometer_data
      {
        in: barometer_in,
        mb: barometer_mb,
        trend: barometer_trend
      }
    end
  end
end
