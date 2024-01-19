require_relative '../requirements.rb'
require_relative '../models/userModel'
require_relative '../connectDatabase'
require_relative '../features/add_to_favourites'
require_relative '../features/rate_movie'
require_relative '../models/movie'
require_relative '../models/rating'
require 'pry'
require 'colorize'

class FindMovie

  @@db_connection = ConnectDB.connection
  @@movies = nil
  @@movie_num = 0
  def find_movies(title)
    if Authentication.current_user
      ds1 = @@db_connection[:movies]
      ds2 = ds1.where(Sequel.ilike(:title, title)) 
      @@movies = ds2
      if @@movies.all.length == 0
        return "No matching movies"
      end
      return "Successfully found related movies".bold
    else
      return "Failed to find related movis"
    end
  end

  def show_movies
    @@movie_num = 0
    @@movies.each do |movie|
      
      puts"no #{@@movie_num} #{movie[:title].red} #{movie[:year].yellow} rating: #{Rating.average_rating_for_movie(movie[:movie_id])}"
      @@movie_num =  @@movie_num + 1
    end
  end

  def get_movies
    return @@movies
  end

  def want_add_favourite
    puts "Enter the number corresponding to the movie from found list"
    num = gets.chomp.to_i
    movie = @@movies.all[num]
    movie_instance = Movie[movie[:movie_id]]
    result = AddToFavourites.save(movie_instance) 
    puts result
  end

  def want_rate

    puts "Enter the number corresponding to the movie from found list"
    num = gets.chomp.to_i
    movie = @@movies.all[num]
    movie_instance = Movie[movie[:movie_id]]

    puts "Enter your rating from range 1-5"
    num = gets.chomp.to_f
    result = RateMovie.save(movie_instance, num) 
    puts"\n"
    puts result
    puts"\n"
  end
end