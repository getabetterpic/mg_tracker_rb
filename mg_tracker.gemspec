# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mg_tracker/version'

Gem::Specification.new do |spec|
  spec.name          = "mg_tracker"
  spec.version       = MgTracker::VERSION
  spec.authors       = ["="]
  spec.email         = ["="]

  spec.summary       = "Migraine tracking and prediction."
  spec.homepage      = "https://github.com/getabetterpic/mg-tracker-rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "guard-rspec", "~> 4.6"
  spec.add_development_dependency "webmock", "~> 1.22"
  spec.add_development_dependency "rubocop-rspec", "~> 1.3"
  spec.add_development_dependency "rubocop", "~> 0.35"
  spec.add_development_dependency "guard-rubocop", "~> 1.2"
  spec.add_dependency "httparty", "~> 0.13"
end