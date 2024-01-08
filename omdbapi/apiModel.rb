require 'httparty'

class ApiModel
  include HTTParty
  base_uri 'http://www.omdbapi.com'

  def initialize(api_key)
    @api_key = api_key
  end

  def search_movie(query)
    options = { query: { apikey: @api_key, s: query } }
    self.class.get('/', options)
  end
end

api_key = '2fee9ad3'
api_model = ApiModel.new(api_key)

response = api_model.search_movie('Inception')

if response['Response'] == 'True'
  movies = response['Search']
  movies.each do |movie|
    puts "#{movie['Title']} (#{movie['Year']})"
  end
else
  puts "Error: #{response['Error']}"
end