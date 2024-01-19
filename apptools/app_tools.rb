require_relative '../features/authentication'
require_relative '../omdbapi/apiModel'
require_relative '../features/save_movie'
require_relative '../models/movie'
require_relative '../models/favourites'
require_relative '../features/find_movie'
require 'pry'
require 'json'
require 'colorize'

module Apptools

  class Tools
    @@find_movie = FindMovie.new
    @@api_model = ApiModel.new('2fee9ad3')

    def search_api
      puts "Enter movie to search"
      movie_search = gets.chomp

      begin
        response = @@api_model.search_movie(movie_search)

        if response['Response'] == 'True'
          movies = response['Search']

          if movies.empty?
            puts "No movies found for '#{movie_search}'.\n"
            return
          end

          i = 0

          movies.each do |movie|
            puts "=======================================\n".yellow
            puts "no .#{i} #{movie}\n\n"
            i += 1
          end

          puts "\nSelect the movie to add by inputting its number"
          movie_num = gets.chomp.to_i

          selected_movie = movies[movie_num.to_i]
          
          puts "\nSelected movie: #{selected_movie}\n".green
          puts "\n"
          movie = Movie.new(imdb_id: selected_movie['imdbID'], title: selected_movie['Title'], year: selected_movie['Year'], type: selected_movie['Type'], poster: selected_movie['Poster'])

          result = SaveMovie.save(movie)

          puts "\n#{result}\n".grey
          puts"\n"
        else
          puts "Error: #{response['Error']}"
        end

      rescue StandardError => e
        puts "An error occurred: #{e.message}"
        # Optionally, you can log the error or take other actions here
      end
    end
 
    def app_search
      begin
        search
      rescue StandardError => e
        puts "An error occurred: #{e.message}"
      end
    end

    def add_favourite
      @@find_movie.want_add_favourite
      puts"\n"
    end

    def search
      puts "\nEnter the name of movie "
        movie_search = gets.chomp
        movie_search = movie_search + "%"
        @@find_movie = FindMovie.new
        result = @@find_movie.find_movies(movie_search)
        puts "#{result}\n"
        if @@find_movie.get_movies.all.length >0
          @@find_movie.show_movies
          puts"\n"
        end
    end

    def get_movies
      @@find_movie.get_movies.all
    end

    def rate
      @@find_movie.want_rate
    end

    def favourites
      movie_num = 0
      favourites =  Favourite.favourites.all
        if favourites.length> 0
          favourites.each do |favourite|
            movie = Movie[favourite[:movie_id]]
           puts "#{movie_num} #{movie[:title].green} #{movie[:year].yellow}"
            # binding.pry
            movie_num = movie_num + 1
          end
        else
          puts "You currently do not have favourites"
        end
    end
  end
end
