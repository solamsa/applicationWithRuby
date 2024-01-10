require 'uri'
require 'net/http'

url = URI("https://imdb8.p.rapidapi.com/auto-complete?q=game")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '45cb1137e0msh2dae18e10f1f128p1d2defjsn13a4d1b677d8'
request["X-RapidAPI-Host"] = 'imdb8.p.rapidapi.com'

response = http.request(request)
puts response.read_body