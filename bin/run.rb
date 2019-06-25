#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def search
  puts "Welcome Star Wars fan!"

  puts "Enter the number of the option you want"
  puts "1. Search for a character"
  puts "2. Search a movie"
  puts "3. Search for a planet"
  puts "4. Search for a vehicle"
  puts "5. Search for a starship"
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
    puts "Enter a movie name"
    movie = gets.chomp.downcase
    begin
      show_movie_info(movie)
    rescue
      puts "Movie not found"
      search
    end
  when "3"
    puts "Search for a planet"
    planet = gets.chomp.downcase
    begin
      show_planet_info(planet)
    rescue
      puts "Planet not found"
      search
    end
  when "4"
    puts "Enter a vehicle"
    vehicle = gets.chomp.downcase
    begin
      show_vehicle_info(vehicle)
    rescue
      puts "Vehicle not found"
      search
    end
  when "5"
    puts "Enter a starship name"
    starship = gets.chomp.downcase
    begin
      show_starship_info(starship)
    rescue
      puts "Starship not found"
      search
    end
  when "6"
    puts "Search for a species"
    species = gets.chomp.downcase
    begin
      show_species_info(species)
    rescue
      puts "Species not found"
      search
    end
  else
    puts "Invalid input"
  end
end
search
