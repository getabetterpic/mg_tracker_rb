require 'mg_tracker/weather_service'

module MgTracker
  # `Weather` makes various data about the weather available
  class Weather
    attr_accessor :city, :state
    attr_reader :service

    def initialize(service = WeatherService.new, options = {})
      @service = service
      @city = service.city = options[:city] || 'San Francisco'
      @state = service.state = options[:state] || 'CA'
    end

    %w(in mb trend).each do |value|
      define_method("barometer_#{value}") do
        service.send("barometer_#{value}")
      end
    end
  end
end
