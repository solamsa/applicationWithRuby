require_relative 'authentication'
require_relative 'omdbapi/apiModel'
require_relative 'save_movie'
require_relative 'models/movie'
require_relative 'find_movie'
require 'json'
 
class AppOptions
  def operate
    loop do
      puts "1. Add new movie to the system"
      puts "2. Find movie"
      puts "3. Exit"
      choice = gets.chomp
        
      case choice
      when '1'
        api_model = ApiModel.new('2fee9ad3')

        puts "Search the movie to add"
        movie_search = gets.chomp
        response = api_model.search_movie(movie_search)
        i = 0
      
        if response['Response'] == 'True'
          movies = response['Search']
          movies.each do |movie|
            puts "no .#{i} #{movie}\n\n)"
            i = i+1
        end

        puts "\nSelect the movie to add by inputing it's number"
        movie_num = gets.chomp.to_i
        # Movie.new(imdb_id: "tt1375666", title: 'Inception', year: "2010")
        selected_movie = movies[movie_num.to_i]
        puts "selected movie: #{selected_movie}"
        movie = Movie.new(imdb_id: selected_movie['imdbID'], title: selected_movie['Title'], year: selected_movie['Year'], type: selected_movie['Type'], poster: selected_movie['Poster'])
        result = SaveMovie.save(movie)
        puts result
        else
          puts "Error: #{response['Error']}"
        end
        # puts "running app #{api_key}"

      when '2'
        find_movie = FindMovie.new
        find_movie.getMovies("abc")

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