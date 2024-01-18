require_relative 'features/authentication'
require_relative 'omdbapi/apiModel'
require_relative 'features/save_movie'
require_relative 'models/movie'
require_relative 'features/find_movie'
require_relative 'apptools/app_tools'
require 'pry'

require 'json'
 
class AppOptions

  @@app_tools = Apptools::Tools.new
  def operate
    loop do
      puts "1. Add new movie to the app"
      puts "2. Find movie from the app"
      puts "3. Add movie to favourites"
      puts "4. Rate a movie"
      puts "5. Exit"
      choice = gets.chomp
        
      case choice
      when '1'
      @@app_tools.search_api
      when '2'
        @@app_tools.app_search
      when '3'
        @@app_tools.app_search
        if @@app_tools.get_movies.length > 0
          @@app_tools.add_favourite
        end
      when '4'
        @@app_tools.app_search
        if @@app_tools.get_movies.length > 0
          @@app_tools.rate
        end
        
      when '5'
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end