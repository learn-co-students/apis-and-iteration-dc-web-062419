#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def search
  puts "Welcom Star Wars fan!"
  
  puts "Enter the number of the option you want"
  puts "1. Search for a character"
  puts "2. Search a movie"
  puts "3. Search for a planet" 
  puts "4. Search for a vehicle" 
  puts "5. Search for a straship" 
  puts "6. Search for a species" 
  input = gets.chomp

  case input
  when "1"
    puts "Enter a character name"
    character = gets.chomp.downcase
    begin
      show_character_movies(character)
    rescue
      puts "Character not found"
      search
    end
  when "2"
    puts "Search for a movie"
  when "3"
    puts "Search for a planet"
  when "4"
    puts "Search for a vehicle"
  when "5"
    puts "Search for a planet"
  when "6"
    puts "Search for a planet"
  else
    puts "Invalid input"
  end

  

end

search
