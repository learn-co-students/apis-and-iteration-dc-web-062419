require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  results_array = response_hash["results"]
  film_info = []
  results_array.each do |hash|
    if hash["name"] == character_name
      hash["films"].each do |url|
        film_string = RestClient.get(url)
        film_hash = JSON.parse(film_string)
      film_info << film_hash
    end
  end
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end
film_info
end

film_hash = get_character_movies_from_api("Luke Skywalker")

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
movie_list = films.map do |movie_hash|
 movie_hash["title"] 
 binding.pry
end
puts movie_list
end

print_movies(film_hash)

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
