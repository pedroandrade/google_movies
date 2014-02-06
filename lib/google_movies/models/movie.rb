require 'nokogiri'
require 'net/http'
require 'uri'
module GoogleMovies
  class Movie

    attr_accessor :name, :id, :information, :times, :url, :synopsis

    def initialize(name, id, information, times, url)
      @name        = name
      @id          = id
      @information = information.gsub('- Trailer - IMDb - : ', '').strip
      @url         = url
      @times       = times
    end

    def synopsis
      @synopsis ||= fetch_synopsis.split(/\.([^.]*)$/).first
    end

    private

      def fetch_synopsis
        url = URI.parse(URI.encode("http://google.com/#{@url}".strip))
        doc = Nokogiri::HTML(Net::HTTP.get_response(url).body)
        syn = doc.search('div[@class="syn"] span').first.content
        syn_continue = doc.search('div[@class="syn"] span[@id="SynopsisSecond0"]').first.content
        syn + " " + syn_continue
      end
  end

end
