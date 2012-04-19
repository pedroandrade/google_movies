module GoogleMovies
  class Movie
  
    attr_accessor :name, :id, :information
  
    def initialize(name, id, information)
      @name = name
			@id = id
			@information = information
    end
  end
end