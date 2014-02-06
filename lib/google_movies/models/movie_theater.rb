module GoogleMovies
  class MovieTheater

    attr_accessor :movies, :name, :address, :id

    def initialize(name, address, id, movies = [])
      self.movies  = movies
      self.name    = name
      self.address = address
      self.id      = id
    end
  end
end
