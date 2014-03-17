# encoding: utf-8
require 'spec_helper'

describe HttpCapture do

  let(:city_url) { 'http://www.google.com/movies?near=Joao+Pessoa' }

  subject do
    VCR.use_cassette('google_movies/http_capture') do
      HttpCapture::Client.new(city_url)
    end
  end

  it 'return a new instance of client' do
    expect(subject).to_not be_nil
  end

  context 'movie theater' do

    it 'returns one movie theater' do
      expect(subject.movie_theaters.size).to be > 0
    end

    it 'returns a movie theater with id' do
      expect(subject.movie_theaters[0].id).to_not be_nil
    end
  end

  context 'movie' do

    it 'returns the movies' do
      expect(subject.movie_theaters[0].movies.size).to be > 0
    end

    it 'returns a movie with id' do
      expect(subject.movie_theaters[0].movies[0].id).to_not be_nil
    end

    it 'returns the movie information' do
      expect(subject.movie_theaters[0].movies[0].information).to_not be_nil
    end

    it 'returns movie with times' do
      expect(subject.movie_theaters[0].movies[0].times).to be_an_instance_of Array
    end
  end

end
