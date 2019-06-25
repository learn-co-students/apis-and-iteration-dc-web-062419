#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def get_character_from_user
  puts "Enter a character"
  gets.chomp
end

welcome
character = get_character_from_user
show_character_movies(character)
