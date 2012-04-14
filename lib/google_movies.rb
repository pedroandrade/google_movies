# encoding: utf-8 
require File.expand_path('../google_movies/http_capture', __FILE__)
require 'nokogiri'
require 'open-uri'


module GoogleMovies
  
  class Client
    
    ROOT_URL = "http://www.google.com/movies"
    
    def initialize(city)
      @city = city
      @http_client = HttpCapture::Client.new("#{ROOT_URL}?near=#{@city}")
    end
    
    def movies_theaters
      @http_client.movies_theater
    end
    
  end
end