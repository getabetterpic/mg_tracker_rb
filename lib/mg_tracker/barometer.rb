require 'mg_tracker/weather'

module MgTracker
  class Barometer

    attr_reader :city, :state, :weather

    def initialize(options = {})
      @weather = weather = options[:weather] || Weather.new
      @city = weather.city = options[:city] || 'San Francisco'
      @state = weather.state = options[:state] || 'CA'
    end

    def inches
      weather.barometer_in
    end

    def mb
      weather.barometer_mb
    end

    def trend
      weather.barometer_trend
    end
  end
end
