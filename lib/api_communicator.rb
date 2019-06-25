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
#-----------------------------------------------------------------------------

def get_planets_from_api(planet_name)
  #make the web request

  response_string = RestClient.get('http://www.swapi.co/api/planets/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |planet|
    if planet["name"].downcase.start_with?(planet_name)
      return planet
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


def print_planet_info(planet)
  # some iteration magic and puts out the movies in a nice list
  puts "Name: #{planet["name"]}"
  puts "Rotation Period: #{planet["rotation_period"]}"
  puts "Orbital Period: #{planet["orbital_period"]}"
  puts "Diameter: #{planet["diameter"]}"
  puts "Climate: #{planet["climate"]}"
  puts "Gravity: #{planet["gravity"]}"
  puts "Terrain: #{planet["terrain"]}"
  puts "Surface Water: #{planet["surface_water"]}"
  puts "Population: #{planet["population"]}"
  puts ""
  end

def show_planet_info(planet)
  info = get_planets_from_api(planet)
  print_planet_info(info)
end

#-----------------------------------------------------------------------------

def get_species_from_api(species_name)
  #make the web request

  response_string = RestClient.get('http://www.swapi.co/api/species/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |species|
    if species["name"].downcase.start_with?(species_name)
      return species
    end
  end
end

def print_species_info(species)
  # some iteration magic and puts out the movies in a nice list
  puts "Name: #{species["name"]}"
  puts "Classification: #{species["classification"]}"
  puts "Designation: #{species["designation"]}"
  puts "Average Height: #{species["average_height"]}"
  puts "Skin Colors: #{species["skin_colors"]}"
  puts "Hair Colors: #{species["hair_colors"]}"
  puts "Eye Colors: #{species["eye_colors"]}"
  puts "Average Lifespan: #{species["average_lifespan"]}"
  puts "Homeworld: #{species["homeworld"]}"
  puts "Language: #{species["language"]}"
  puts ""
  end

def show_species_info(species)
  info = get_species_from_api(species)
  print_species_info(info)
end
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?



def get_movie_from_api(movie_name)
  #make the web request

  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |movie|
    if movie["title"].downcase.start_with?(movie_name)
      return movie
    end
  end
end

def show_movie_info(movie)
  movie = [get_movie_from_api(movie)]
  print_movies(movie)
end

def print_starships(starships)
  # some iteration magic and puts out the movies in a nice list
  starships.each do |starship|
    puts "name: #{starship["name"]}"
    puts "Model: #{starship["model"]}"
    puts "Cost: $#{starship["cost_in_credits"]}"

  end
end

def get_starship_from_api(starship_name)
  response_string = RestClient.get('http://www.swapi.co/api/starships/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |starship|
    if starship["name"].downcase.start_with?(starship_name)
      return starship

    end
  end
end

  def show_starship_info(starship)
    starship = [get_starship_from_api(starship)]
    print_starships(starship)
  end
