require 'rest-client'
require 'json'
require 'pry'

# Returning films for given character
def films(character, response_hash)
  films_list = []
  response_hash["results"].each { |thing| thing["name"].downcase == character.downcase ?  films_list = thing["films"] : nil }
  films_list
end

# Making a web request
def make_web_request(path)
  response_string = RestClient.get(path)
  response_hash_movie = JSON.parse(response_string)
end

# Build collection of information on films
def collect_the_films(urls)
  collected_film_info = {}
  urls.each { |path| collected_film_info[make_web_request(path)["title"]] = make_web_request(path) }
  movie_collection = collected_film_info
end

def print_movies(movie_collection)
  # some iteration magic and puts out the movies in a nice list
  movie_collection.each {|k,v| puts "#{k} was directed by #{v["director"]}" }
end

def get_character_movies_from_api(character)
  #runs all the helper methods
  response_hash = make_web_request('http://www.swapi.co/api/people/')
  urls = films(character, response_hash)
  movie_collection = collect_the_films(urls)
  print_movies(movie_collection)
end

# def show_character_movies(character)
#   get_character_movies_from_api(character)
#   # films = get_character_movies_from_api(character)
#   # print_movies(films)
# end #this one isn't necessary if we just call the get_character_movies_from_api directly from the run.rb

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
