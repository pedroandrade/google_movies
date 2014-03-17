# encoding: utf-8
$:.unshift File.expand_path('../models', __FILE__)
require 'nokogiri'
require 'uri'
require 'movie'
require 'movie_theater'
require 'open-uri'

module HttpCapture

  def movies_theaters(page_url)
    http_address = URI.parse(URI.encode(page_url.strip))
    doc          = page_doc(http_address)
    pages        = doc.css('div.n a[@href]')

    if !pages.empty?
      pages.each do |p|
        http_address = URI.parse(URI.encode("http://google.com#{p.values.first.strip}"))
        doc = page_doc(http_address)
        get_information(doc)
      end
    else
      get_information(doc)
    end
  end

  def get_information(doc)
    doc.search('div[@class="theater"]').inject([]) do |array, theater|
      array << create_movie_theater_with(theater, get_movies(theater))
      array
    end
  end

  private

    def page_doc(uri)
      Nokogiri::HTML(open(uri), nil, "UTF-8")
    end

    def create_movie_theater_with(theater, movies)
      id   = theater.search('div[@class="desc"]').first.attr("id").gsub("theater_", "")
      name = theater.search('h2[@class="name"]').first.content
      info = theater.search('div[@class="info"]').first.content
      
      GoogleMovies::MovieTheater.new(name, info, id, movies)
    end

    def create_movie_with(movie)
      name  = movie.search('div[@class="name"]').first.search('a').first.content
      url   = movie.search('div[@class="name"]').first.search('a').first.attr("href")
      id    = url.split("&mid=")[1]
      info  = movie.search('span[@class="info"]').first.content
      times = get_movies_times(movie)

      GoogleMovies::Movie.new(name, id, info, times, url)
    end

    def get_movies_times(movie)
      movie.css(".times").inject("") do |times, time|
        times = time.children.text.split('&nbsp')
        times
      end
    end

    def get_movies(theater)
      theater.search('div[@class="movie"]').inject([]) do |arr, value|
        arr << create_movie_with(value)
        arr
      end
    end

  class Client
    include HttpCapture

    attr_accessor :movie_theaters

    def initialize(page_url)
      @movie_theaters = movies_theaters(page_url)
    end

  end
end
