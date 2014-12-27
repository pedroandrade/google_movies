require 'spec_helper'

describe GoogleMovies do

  subject { GoogleMovies::Client.new('Joao Pessoa') }

  it 'returns movies theaters' do
    VCR.use_cassette('google_movies') do
      expect(subject.movie_theaters.size).to be > 0
    end
  end

end