require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  results = response_hash["results"]
  character_info = results.find do |info| 
    info["name"].downcase == character_name
    end
      film_array = character_info["films"].map do |title_url|
        response_title = RestClient.get(title_url)
        response_movie_hash = JSON.parse(response_title)
        movie_name = response_movie_hash["title"]
        films_hash = {title: movie_name} 
        films_hash
  end

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  movie_array = []
  films.each do |title|
    title.each do |name, movie|
      movie_array << movie
    end
  end
  movie_array.each_with_index do |movie, idx|
    puts "#{idx+1}. #{movie}"
    end 
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
