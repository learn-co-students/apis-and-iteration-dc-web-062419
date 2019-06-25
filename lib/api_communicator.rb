#!/usr/bin/env ruby

require_relative "../lib/command_line_interface.rb"

require 'rest-client'
require 'json'
require 'pry'
STAR_WARS_LIST = "http://www.swapi.co/api/people/"

def go_to_api
  #make the web request
  movie_url = STAR_WARS_LIST #+ character_from_user
  answer = RestClient.get(movie_url)
  x = JSON.parse(answer.body)
end

def find_films(character_from_user)
  characters_info = go_to_api
  characters_info["results"].each do |person_data|
    if person_data["name"] == character_from_user
      return person_data["films"]
    end
  end
end

<<<<<<< HEAD
def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
  # binding.pry
=======

def print_movies(film_urls)
  film_array = [ ]
  film_urls.each do |film| 
    answer = RestClient.get(film)
    json = JSON.parse(answer.body)
    film_array << json
  end
>>>>>>> 70374fddd43a2f4929e71e080e457695bb119708
end


# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   print_movies(film)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
