require 'pp'
require 'httparty'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

counter = 1
718.times do
  url = "http://pokeapi.co/api/v1/pokemon/#{counter}/"
  response = HTTParty.get(url)
  Pokemon.create( name:     response["name"],
                  pkdx_id:  response["pkdx_id"],
                  height:   response["height"],
                  weight:   response["weight"],
                  attack:   response["attack"],
                  defense:  response["defense"],
                  speed:    response["speed"],
                  hp:       response["hp"],
                  img:      "http://img.pokemondb.net/artwork/#{response["name"].downcase}.jpg")
  counter += 1
end