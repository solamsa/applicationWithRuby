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