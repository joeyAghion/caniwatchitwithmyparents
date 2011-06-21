#!/usr/bin/env ruby

# curl http://parks.swank.com/comprehensive.asp > movies.html
# bundle exec script/parse_movies.rb > config/movies.yml

require File.expand_path('config/environment')

file_name = ARGV[0] || 'movies.html'
file_name = File.expand_path(file_name)

require 'loofah'

doc = Loofah.document(File.read(file_name))

movies = {}
doc.xpath("//tr[@bgcolor='#FFFFFF'] | //tr[@bgcolor='#E7E7E7']").each do |row|
  name = row.children[0].text.strip
  movies[name] = row.children[2].text.strip if name.valid_encoding?
end

$stdout.puts movies.to_yaml
