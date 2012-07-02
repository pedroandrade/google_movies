module GoogleMovies
  class Movie

    attr_accessor :name, :id, :information, :times

    def initialize(name, id, information, times)
      @name = name
      @id = id
      @information = information.gsub("- Trailer - IMDb - : ", "").strip
      @times = times
    end
  end
end
