module GoogleMovies
  class MovieTheater

    attr_accessor :movies, :name, :address, :id

    def initialize(name, address, id, movies = [])
      @movies = movies
      @name = name
      @address = address
      @id = id
    end
  end
end