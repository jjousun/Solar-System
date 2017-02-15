# create a new Class
class Planet
  attr_accessor :name, :diameter, :mass, :moon, :orbit, :distance_from_the_sun, :solar_rotation
  # am still trying to understand when instance variables should be read vs written over

  #initialize; attributes for what will be there every time .new
  def initialize(planet_hash)
    @name = planet_hash[:name]
    @diameter = planet_hash[:diameter]
    @mass = planet_hash[:mass]
    @moon = planet_hash[:moon]
    @orbit = planet_hash[:orbit]
    @distance_from_the_sun = planet_hash[:distance]
    @solar_rotation = planet_hash[:rotation]
  end

  # method for printing out all the info for each planet
  def print_info
    puts "Name: #{ @name }\nDiameter: #{ @diameter }\nMass: #{ @planet }\nMoon(s): #{ @moon }\nOrbit: #{ @orbit }\nDistance From Sun: #{ @distance_from_the_sun }\nSolar Rotation: #{ @solar_rotation }"
  end
end # end of Planet class

# all the planets with their information in hashes
mercury_hash = {
  name: "Mercury",
  diameter: 3032,
  mass: 3.285 * 10**23,
  moon: 0, orbit: 88,
  distance: 35.98 * 10**6,
  rotation: 175.97
}
venus_hash = {
  name: "Venus",
  diameter: 7520.8,
  mass: 4.867 * 10**24,
  moon: 0,
  orbit: 225,
  distance: 67.24 * 10**6,
  rotation: 243.025
}
earth_hash = {
  name: "Earth",
  diameter: 7917.5,
  mass: 5.972 * 10**24,
  moon: 1,
  orbit: 365,
  distance: 92.96 * 10**6,
  rotation: 26.24
}
mars_hash = {
  name: "Mars",
  diameter: 4212,
  mass: 6.39 * 10**23,
  moon: 2,
  orbit: 687,
  distance: 141.6  * 10**6,
  rotation: 24.37
}
jupiter_hash = {
  name: "Jupiter",
  diameter: 86881.4,
  mass: 1.898 * 10**27,
  moon: 67,
  orbit: 4380,
  distance: 483.8 * 10**6,
  rotation: 9.55
}
saturn_hash = {
  name: "Saturn",
  diameter: 72367.4,
  mass: 5.683 * 10**26,
  moon: 62,
  orbit: 10585,
  distance: 888.2 * 10**6,
  rotation: 10.2
}
uranus_hash = {
  name: "Uranus",
  diameter: 31518,
  mass: 8.681 * 10**25,
  moon: 27,
  orbit: 30660,
  distance: 1.784 * 10**9,
  rotation: 17.14
}
neptune_hash = {
  name: "Neptune",
  diameter: 30599,
  mass: 1.024 * 10**26,
  moon: 13,
  orbit: 60225,
  distance: 2.795 * 10**9,
  rotation: 19.1
}
pluto_hash = {
  name: "Pluto",
  diameter: 1475,
  mass: 1.30900 * 10**22,
  moon: 5,
  orbit: 90520,
  distance: 3.67 * 10**9,
  rotation: 6.4
}

# creating new instances of the Planet class (for all the planets)
mercury = Planet.new(mercury_hash)
venus = Planet.new(venus_hash)
earth = Planet.new(earth_hash)
mars = Planet.new(mars_hash)
jupiter = Planet.new(jupiter_hash)
saturn = Planet.new(saturn_hash)
uranus = Planet.new(uranus_hash)
neptune = Planet.new(neptune_hash)
pluto = Planet.new(pluto_hash)

# I think I could store all the planet hashes into an array, i.e. on line 23. Not sure if that would
# be 'cleaner' or not
planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]

puts "Let's learn about the planets of the solar system!"

puts "Here are the planets: "
planets.each_with_index { |planet, index| puts "#{index+1}. #{planet.name}" }

# asking user for which planet to print info about, check validity of user's choice
print "Which planet do you want to learn about? "
number = gets.chomp.to_i
until (1..10).to_a.include? number
  print "Please pick a valid number! "
  number = gets.chomp.to_i
end

# print out the info for user's choice planet using method in Planet class
planets.each_with_index do |planet, index|
  if number == index + 1
    planet.print_info
  end
end

# Create a SolarSystem class that has an attribute planets that has zero to many Planet instances. There are a few different options for how to associate the planets with your solar system:
# Create a method that adds a single planet to a solar system
# Create a method that adds a list of planets to an existing list of planets

# create SolarSystem class
class SolarSystem
  attr_accessor :planets, :name

  def initialize(name)
    @planets = []
    @name = name
  end

  # method for adding planet for array (already given when .new; empty)
  def add(planet)
    @planets << planet
  end

  # method for printing out info
  def print_all
    @planets.each { |planet| planet.print_info }
  end
end

puts "\nLet's create a new solar system!"

milky_way = SolarSystem.new("Milky Way")

# checking to see what new solar system contains; should be nothing
# print milky_way.planets

# add a planet to the solar system
milky_way.add(earth)

milky_way.add(mars)

# check to see that planet was added to solar system
print "The solar system #{milky_way.name} has #{milky_way.planets.count} planet(s)\n"

# print out info of the planets in the solar system; another check to see that adding planets worked
milky_way.print_all
