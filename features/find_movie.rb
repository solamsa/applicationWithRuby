require_relative '../requirements.rb'
require_relative '../models/userModel'
require_relative '../connectDatabase'
require 'pry'

class FindMovie

  @@db_connection = ConnectDB.connection
  @@movies = nil
  def find_movies(title)
    if Authentication.current_user
      ds1 = @@db_connection[:movies]
      ds2 = ds1.where(Sequel.ilike(:title, title)) 
      @@movies = ds2
      if @@movies.all.length == 0
        return "No matching movies"
      end
      return "Successfully found related movies"
    else
      return "Failed to find related movis"
    end
  end

  def show_movies
    @@movies.each do |movie|
      puts movie
    end
  end

  def get_movies
    return @@movies
  end


end