#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"


welcome 
user_input = get_character_from_user
film_urls = find_films(user_input)
puts print_movies(film_urls)
# show_character_movies(character)
