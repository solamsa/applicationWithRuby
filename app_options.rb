require_relative 'features/authentication'
require_relative 'omdbapi/apiModel'
require_relative 'features/save_movie'
require_relative 'models/movie'
require_relative 'features/find_movie'
require 'json'
 
class AppOptions

  @@find_movie = FindMovie.new
  @@api_model = ApiModel.new('2fee9ad3')
  def operate
    loop do
      puts "1. Add new movie to the system"
      puts "2. Find movie"
      puts "3. Exit"
      choice = gets.chomp
        
      case choice
      when '1'
        

        puts "Search the movie to add"
        movie_search = gets.chomp
        response = @@api_model.search_movie(movie_search)
        i = 0
      
        if response['Response'] == 'True'
          movies = response['Search']
          movies.each do |movie|
            puts "no .#{i} #{movie}\n\n)"
            i = i+1
        end

        puts "\nSelect the movie to add by inputing it's number"
        movie_num = gets.chomp.to_i
        selected_movie = movies[movie_num.to_i]
        puts "selected movie: #{selected_movie}"
        movie = Movie.new(imdb_id: selected_movie['imdbID'], title: selected_movie['Title'], year: selected_movie['Year'], type: selected_movie['Type'], poster: selected_movie['Poster'])
        result = SaveMovie.save(movie)
        puts result
        else
          puts "Error: #{response['Error']}"
        end

      when '2'
        puts "\nEnter the name of the movie you want to search"
        movie_search = gets.chomp
        movie_search = movie_search + "%"
        @@find_movie = FindMovie.new
        result = @@find_movie.find_movies(movie_search)
        puts "#{result}\n"
        @@find_movie.show_movies
      when '3'
        result = Authentication.logout
        puts result
        break

      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end