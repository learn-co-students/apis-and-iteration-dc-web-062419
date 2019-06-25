#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def get_character_from_user
  puts "Welcom Star Wars fam! "
  puts "Enter a character to see the movies that they are in"
  gets.chomp
end

welcome
character = get_character_from_user
show_character_movies(character)
