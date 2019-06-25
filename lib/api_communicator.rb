require 'rest-client'
require 'json'
require 'pry'

def get_movies_from_api(movies)
  # 
  films_data = []
  movies.each do |film_link|
    response = RestClient.get(film_link)
    json = JSON.parse(response)
    films_data << json
  end
  return films_data
end

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |character|
    if character["name"].downcase.start_with?(character_name)
      return {"films": character["films"], "name": character["name"]}
    end
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts "Title: #{film["title"]}"
    puts "Release Date: #{film["release_date"]}"
    puts "Director: #{film["director"]}"
    puts ""
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  film_data = get_movies_from_api(films[:films])
  puts film_data
  print "\n"
  print "Movies that #{films[:name]} is in:\n"
  print_movies(film_data)
end

def get_vehicle_info_from_api(vehicle_name)
  # Pulls vehicle information from the API
  # Returns: Vehicle hash for vehicle that matches input
  response = RestClient.get('http://www.swapi.co/api/vehicles/')
  response_hash = JSON.parse(response)

  response_hash["results"].each do |vehicle|
    if vehicle["name"].downcase.start_with?(vehicle_name)
      return vehicle
    end
  end
end

def show_vehicle_info(vehicle_name)
  vehicle = get_vehicle_info_from_api(vehicle_name)
  print_vehicle_info(vehicle)
end

def print_vehicle_info(vehicle)
  puts "\n"
  puts "Name: #{vehicle["name"]}"
  puts "Model: #{vehicle["model"]}"
  puts "Manufacturer: #{vehicle["manufacturer"]}"
  puts "Cost in credits: #{vehicle["cost_in_credits"]}"
  puts "Length: #{vehicle["length"]}"
  puts "Max Atmosphering Apeed: #{vehicle["max_atmosphering_speed"]}"
  puts "Crew: #{vehicle["crew"]}"
  puts "Passengers: #{vehicle["passengers"]}"
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?