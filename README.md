# MgTrackerRb

MgTracker helps track migraines, along with environmental factors that might trigger one. It then
predicts when a migraine might occur, alerting a user.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mg_tracker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mg_tracker

## Usage

A `config/ws_api_key.yml` file will need to be set on your project's root, with a single key/value
pair like:

``` yaml
WS_API_KEY: 'yourkeyhere'
```

Then run `bin/console` and type:

``` ruby
> barometer = MgTracker::Barometer.new(city: 'Atlanta', state: 'GA')
> barometer.inches
  => '30.01'
```

`MgTracker::Barometer#new` takes a city and state and returns the barometer readings for that city.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/getabetterpic/mg_tracker_rb.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
This gem uses the [Weather API](http://www.wunderground.com/weather/api/d/docs) from Weather
Underground and is subject to the [Weather Underground API terms and conditions](http://www.wunderground.com/weather/api/d/terms.html).
