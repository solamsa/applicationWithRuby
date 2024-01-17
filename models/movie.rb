require_relative '../requirements.rb'
require_relative '../connectDatabase.rb'

Sequel::Model.plugin :validation_helpers
class Movie < Sequel::Model

  one_to_many :favourites 
  one_to_many :ratings
  set_primary_key :movie_id
  unrestrict_primary_key
  def validate
    super
    validates_presence :imdb_id
    validates_unique :imdb_id
    validates_presence :title
  end
  
  # dataset module do
  #   def all_movies
  #     select(:id, :title)
end