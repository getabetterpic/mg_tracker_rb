require 'mg_tracker/weather_service'

module MgTracker
  class Weather

    attr_accessor :city, :state

    def initialize(service = WeatherService.new, options = {})
      @service = service
      @city = service.city = options[:city] || 'San Francisco'
      @state = service.state = options[:state] || 'CA'
    end

    def barometer_in(options = {})
      @service.barometer_in
    end

    def barometer_mb
      @service.barometer_mb
    end

    def barometer_trend
      @service.barometer_trend
    end
  end
end
