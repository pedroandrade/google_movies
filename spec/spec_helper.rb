$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
$:.unshift File.expand_path('../../lib/google_movies', __FILE__)

require 'rspec'
require 'google_movies'
require 'http_capture'
require 'vcr'

RSpec.configure do |config|

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    c.hook_into :webmock
  end
end
