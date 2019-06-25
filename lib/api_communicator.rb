require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_urls(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  films_arr = []
    response_hash["results"].each do |ch|
        if ch["name"] == character_name
          films_arr = ch["films"]  
        end
    end
    films_arr
  end

  def get_character_movies_from_api(character_name)
    get_character_movies_urls(character_name).map do |api_url| 
      films_req = RestClient.get(api_url)
      films_response = JSON.parse(films_req)
    end
  end
  # binding.pry 

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(films, character)
  films.each do |film| 
  puts "#{character} was in #{film["title"]}"
  end   # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films, character)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
