# encoding: utf-8
$:.unshift File.expand_path('../models', __FILE__)
require 'nokogiri'
require "net/http"
require "uri"
require 'movie'
require 'movie_theater'

module HttpCapture

  def movies_theaters(page_url)
    @http_address = URI.parse(URI.encode(page_url.strip))
    @doc = page_doc(@http_address)
    pages = @doc.css('div.n a[@href]')
    pages.each do |p|
      http_address = URI.parse(URI.encode("http://google.com#{p.values.first.strip}"))
      doc = page_doc(http_address)
      get_information(doc)
    end
    @movies_theater
  end

  def get_information(doc)
    @doc = doc
    @movies_theater ||= []

    @doc.search('div[@class="theater"]').each do |theater|
      movies = []
      movies = get_movies(theater)
      @movies_theater << create_movie_theater_with(theater, movies)
    end
    @movies_theater
  end

  private

  def page_doc(uri)
    Nokogiri::HTML(Net::HTTP.get_response(uri).body)
  end

  def create_movie_theater_with(theater, movies)
    id = theater.search('div[@class="desc"]').first.attr("id").gsub("theater_", "")
    name = theater.search('h2[@class="name"]').first.content
    info = theater.search('div[@class="info"]').first.content
    GoogleMovies::MovieTheater.new(name, info, id, movies)
  end

  def create_movie_with(movie)
    name = movie.search('div[@class="name"]').first.search('a').first.content
    url = movie.search('div[@class="name"]').first.search('a').first.attr("href")
    id = url.split("&mid=")[1]
    info = movie.search('span[@class="info"]').first.content
    times = get_movies_times(movie)
    GoogleMovies::Movie.new(name, id, info, times, url)
  end

  def get_movies_times(movie)
    times = ""
    movie.css(".times").each do |time|
      times << time.children.first.text
    end
  end

  def get_movies(theater)
    movies = []
    theater.search('div[@class="movie"]').each do |movie_document|
      movies << create_movie_with(movie_document)
    end
    movies
  end

  class Client
    include HttpCapture

    attr_accessor :movies_theater

    def initialize(page_url)
      @movies_theater = movies_theaters(page_url)
    end

  end
end

