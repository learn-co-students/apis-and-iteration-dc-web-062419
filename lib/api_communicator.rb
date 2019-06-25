require 'rest-client'
require 'json'
require 'pry'

def get_movies_from_api(movies)
  # 
  films_data = []
  movies.each do |film_link|
    response = RestClient.get(film_link)
    json = JSON.parse(response)
    films_data << json
  end
  return films_data
end

def get_character_movies_from_api(character_name)
  #make the web request
  
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |character|
    if character["name"].downcase.start_with?(character_name)
      return {"films": character["films"], "name": character["name"]}
    end
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts "Title: #{film["title"]}"
    puts "Release Date: #{film["release_date"]}"
    puts "Director: #{film["director"]}"
    puts ""
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  film_data = get_movies_from_api(films[:films])
  puts film_data
  print "\n"
  print "Movies that #{films[:name]} is in:\n"
  print_movies(film_data)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?