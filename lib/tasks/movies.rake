namespace :movies do
  task :import => :environment do
    require 'yaml'
    movies = YAML.load_file(File.expand_path('./config/movies.yml'))
    movies.each do |name, rating|
      Movie.find_or_create_by_name(name, :rating => rating)
    end
  end
end
