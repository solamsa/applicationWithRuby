require_relative '../requirements.rb'
require_relative '../connectDatabase.rb'

class Rating < Sequel::Model
  
  many_to_one :users
  many_to_one :movies

  def validate
    super
    validates_presence :rating
    validates_includes (1..5), :rating
    validates_presence :user
    validates_presence :movie
    validates_unique [:user_id, :movie_id]
  end
end