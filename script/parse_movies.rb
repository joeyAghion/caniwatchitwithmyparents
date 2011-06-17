#!/usr/bin/env ruby

# curl http://parks.swank.com/comprehensive.asp > movies.html
# bundle exec script/parse_movies.rb > config/movies.yml

require File.expand_path('config/environment')

file_name = ARGV[0] || 'movies.html'
file_name = File.expand_path(file_name)

require 'loofah'

doc = Loofah.document(File.read(file_name))

movies = []
doc.xpath("//tr[@bgcolor='#FFFFFF']/td[1] | //tr[@bgcolor='#E7E7E7']/td[1]").each do |row|
  row = row.text.strip!
  movies << row if row.valid_encoding?
end

$stdout.puts movies.to_yaml
