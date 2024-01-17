require_relative '../requirements.rb'
require_relative '../models/userModel'
require_relative 'authentication.rb'
require_relative '../models/rating'
require_relative '../models/favourites.rb'

class RateMovie
  def self.save(movie,rating)
    current_user = Authentication.current_user
    if current_user 
      favourite = Rating.create(user: current_user,movie: movie,rating: rating)
      return "Successfully rated movie"
    else
      return "Save failed"
    end
  end
end