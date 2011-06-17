class Movie
  def self.load_movies
    @movies = YAML.load_file('config/movies.yml')
  end
end
