require 'sqlite3'
require 'httparty'

puts "START!"
puts "----------"

File.delete( "pokedex.db" ) if File.exist?( "pokedex.db" )
db = SQLite3::Database.new( "pokedex.db" )

db.execute <<-SQL
  CREATE TABLE Pokedex (
    name    TEXT,
    pkdx_id TEXT,
    height  TEXT,
    weight  TEXT,
    attack  TEXT,
    defense TEXT,
    speed   TEXT,
    hp      TEXT
  );
SQL

puts "pokedex.db created/re-created"
puts "----------"

counter = 1
151.times do
  url = "http://pokeapi.co/api/v1/pokemon/#{counter}/"
  response = HTTParty.get(url)
  db.execute( "INSERT INTO Pokedex
              (name, pkdx_id, height, weight, attack, defense, speed, hp)
              VALUES
              ('#{response["name"]}', '#{response["pkdx_id"]}', '#{response["height"]}', '#{response["weight"]}', '#{response["attack"]}', '#{response["defense"]}', '#{response["speed"]}', '#{response["hp"]}')"
            )
  puts "#{response["name"]} inserted into pokedex.db"
  counter += 1
end

sleep (60) #slight delay to create all the entries

puts "All entries in pokedex.db"
puts "----------"
db.execute( "SELECT * FROM Pokedex;" ) do |row|
  p row
end

response = db.execute <<-SQL
  SELECT name, pkdx_id FROM Pokedex
  WHERE hp >= 60
  ORDER BY name;
SQL

puts "----------"
puts "All entries with hp greater than or equal to 60"
p response