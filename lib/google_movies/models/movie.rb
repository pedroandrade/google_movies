module GoogleMovies
  class Movie
  
    attr_accessor :name, :id
  
    def initialize(name, id)
      @name = name
			@id = id
    end
  end
end