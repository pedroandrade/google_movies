module GoogleMovies
  class Movie

    attr_accessor :name, :id, :information, :times

    def initialize(name, id, information, times)
      @name = name
			@id = id
			@information = information
      @times = times
    end
  end
end
