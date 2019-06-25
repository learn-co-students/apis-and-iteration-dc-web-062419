require 'rest-client'
require 'json'
require 'pry'

###helper method

# Returning films for given character
def films(character, response_hash)
  films_list = []
  response_hash["results"].each do |thing| 
    if thing["name"].downcase == character.downcase
      films_list = thing["films"] 
    end
  end
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

  urls.each do |path|
      collected_film_info[make_web_request(path)["title"]] = make_web_request(path)
      #puts response_hash_movie
  end
  collected_film_info
end


def print_movies(movie_collection)
  # some iteration magic and puts out the movies in a nice list
  binding.pry
  collect_the_films(films).keys
end

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

#   films = []

#   response_hash["results"].each do |thing| 
#     if thing["name"].downcase == character.downcase
#       films = thing["films"] 
#     end
#   end
#  #puts films

  urls = films(character, response_hash)

  collect_the_films(urls)
  movie_collection = collect_the_films(urls)
  print_movies(movie_collection)
  #binding.pry
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

#list_of_films = collect_the_films(urls)



def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
def z 
x = method1
y= method2(x) 

end 