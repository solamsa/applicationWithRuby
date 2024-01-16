require_relative '../requirements.rb'
require_relative '../models/userModel'
require_relative 'authentication.rb'

class SaveMovie

  def self.save(movie)
    if Authentication.current_user && movie.valid?
      movie.save
      return "Successfully saved a movie"
    else
      return "Save failed, movie already exist"
    end
  end
end