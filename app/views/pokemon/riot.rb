require 'pp'
require 'httparty'

url = "https://na.api.pvp.net/api/lol/na/v2.2/match/1688394830?api_key=4f143121-4b49-4dcd-a1b3-ef02c2dc51e7"

response = HTTParty.get(url)
pp response