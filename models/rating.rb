require_relative '../requirements.rb'
require_relative '../connectDatabase.rb'

class Rating < Sequel::Model
  many_to_one :user, key: :user_id, class: :User
  many_to_one :movie, key: :movie_id, class: :Movie
  

  def validate
    super
    validates_presence :user
    validates_presence :movie
    validates_presence :rating
    validates_includes (1..5), :rating
    validates_unique [:user_id, :movie_id]
  end

end