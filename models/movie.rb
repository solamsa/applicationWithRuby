require_relative '../requirements.rb'
require_relative '../connectDatabase.rb'

Sequel::Model.plugin :validation_helpers
class Movie < Sequel::Model

  one_to_many :favourites 
  one_to_many :ratings
  
  def validate
    super
    validates_presence :imdb_id
    validates_unique :imdb_id
    validates_presence :title
  end
  
end