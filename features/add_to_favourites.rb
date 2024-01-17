require_relative '../requirements.rb'
require_relative '../models/userModel'
require_relative 'authentication.rb'
require_relative '../models/movie.rb'
require_relative '../models/favourites.rb'

class AddToFavourites
  def self.save(movie)
    current_user = Authentication.current_user
    if current_user 
      favourite = Favourite.create(user: current_user,movie: movie)
      return "Successfully saved a movie to favourites"
    else
      return "Save failed"
    end
  end
end