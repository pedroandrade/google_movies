require 'spec_helper'

describe GoogleMovies do

  it "should create a client with the city and return movies theaters count" do
    VCR.use_cassette('google_movies') do
      @google_movies = GoogleMovies::Client.new("Joao Pessoa")
      @google_movies.movies_theaters.size.should > 0
    end
  end

end