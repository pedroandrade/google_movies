# encoding: utf-8
require 'spec_helper'

describe HttpCapture do

  class ClientTest
    include HttpCapture
  end

  before(:each) do
    @page ||= Nokogiri::HTML(File.read("spec/fixtures/movies.html"))
    mock_uri = URI.parse(URI.encode("http://www.google.com/movies?near=Joao%20Pessoa".strip))
    ClientTest.any_instance.should_receive(:page_doc).with(mock_uri).and_return(@page)
  end

  subject { @client = ClientTest.new }

  it "should return one movie theater" do
    subject.movies_theaters("http://www.google.com/movies?near=Joao%20Pessoa").size.should == 1
  end

  it "should return the movies" do
    subject.movies_theaters("http://www.google.com/movies?near=Joao%20Pessoa")[0].movies.size.should == 6
  end

  it "should return movie theater with id" do
    subject.movies_theaters("http://www.google.com/movies?near=Joao%20Pessoa")[0].id.should == "9897515771859860123"
  end

  it "should return movie with id" do
    subject.movies_theaters("http://www.google.com/movies?near=Joao%20Pessoa")[0].movies[0].id.should == "9ff9a2dc6776dc6e"
  end

  it "should return movie information" do
    movie_information = "‎Rated 12 anos‎‎ - Subtitled in Portuguese‎"
    movie = subject.movies_theaters("http://www.google.com/movies?near=Joao%20Pessoa")[0].movies[0]
    movie.information.should eql(movie_information)
  end

  it "should return movie with times" do
    subject.movies_theaters("http://www.google.com/movies?near=Joao%20Pessoa")[0].movies[0].times.should == "9ff9a2dc6776dc6e"
  end
end
