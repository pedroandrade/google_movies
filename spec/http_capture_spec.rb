# encoding: utf-8
require 'spec_helper'

describe HttpCapture do
  class ClientTest
    include HttpCapture

    def page_doc(uri)
      Nokogiri::HTML(File.read('spec/fixtures/movies.html'))
    end
  end

  let(:city_url) { 'http://www.google.com/movies?near=Joao%20Pessoa' }
  subject { ClientTest.new }

  it 'returns one movie theater' do
    subject.movies_theaters(city_url).size.should == 1
  end

  it 'returns the movies' do
    subject.movies_theaters(city_url)[0].movies.size.should == 6
  end

  it 'returns a movie theater with id' do
    subject.movies_theaters(city_url)[0].id.should == '9897515771859860123'
  end

  it 'returns a movie with id' do
    subject.movies_theaters(city_url)[0].movies[0].id.should == '9ff9a2dc6776dc6e'
  end

  it 'returns the movie information' do
    movie_information = '‎Rated 12 anos‎‎ - Subtitled in Portuguese‎'

    movie = subject.movies_theaters(city_url)[0].movies[0]
    movie.information.should eql(movie_information)
  end

  it 'returns movie with times' do
    subject.movies_theaters(city_url)[0].movies[0].times.should be_an_instance_of(Array)
  end
end
