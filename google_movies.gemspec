# -*- encoding: utf-8 -*-
require File.expand_path('../lib/google_movies/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lucas Allan"]
  gem.email         = ["lucas.allan@gmail.com"]
  gem.description   = %q{Ruby wrapper to access google movies informations}
  gem.summary       = %q{Ruby wrapper to access google movies informations}
  gem.homepage      = ""

  gem.files         = Dir['lib/**/*.rb']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "google_movies"
  gem.require_paths = ["lib"]
  gem.version       = GoogleMovies::VERSION

  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'nokogiri'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock', '1.8.0'
  gem.add_development_dependency 'rack-test'
end
