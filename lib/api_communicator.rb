require 'rest-client'
require 'json'
require 'pry'

def get_character_movie_urls_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  film_urls = []
  response_hash["results"].each do |set|
    film_urls = set["films"]
  end
  return film_urls
end

def get_character_movies_from_api(film_urls)
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  film_collection = []
  film_urls.each do |url|
    url_string = RestClient.get(url)
    url_hash = JSON.parse(url_string)
    film_collection << url_hash
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  end
  film_collection
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  # puts films["title"]
  films.uniq.each do |film|
    puts film["title"]
  end
end

def show_character_movies(character)
  film_hashes = get_character_movie_urls_from_api(character)
  films = get_character_movies_from_api(film_hashes)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

