require_relative 'features/authentication'
require_relative 'omdbapi/apiModel'
require_relative 'features/save_movie'
require_relative 'models/movie'
require_relative 'models/favourites'
require_relative 'features/find_movie'
require_relative 'apptools/app_tools'
require 'pry'
require 'colorize'

require 'json'
 
class AppOptions

  @@app_tools = Apptools::Tools.new
  def operate
    loop do
      puts "Main Menu".red.bold
      puts "1. Add new movie to the app"
      puts "2. Find movie from the app"
      puts "3. Add movie to favourites"
      puts "4. Rate a movie"
      puts "5. Your favourites"
      puts "6. Remove favourite"
      puts "7. Logout"
      puts"\nOption:" 
      choice = gets.chomp
      puts"\n"   

      case choice
      when '1'
      @@app_tools.search_api
      when '2'
        @@app_tools.app_search
      when '3'
        begin
          @@app_tools.app_search
        if @@app_tools.get_movies.length > 0
          @@app_tools.add_favourite
        end
        rescue StandardError => e
          puts "An error occurred: #{e.message}".red
        end
      when '4'
        begin
          @@app_tools.app_search
          if @@app_tools.get_movies.length > 0
            @@app_tools.rate
          end
        rescue StandardError => e
          puts "An error occurred: #{e.message}".red
        end

      when '5'
        begin
          @@app_tools.favourites
        rescue StandardError => e
          puts "An error occurred: #{e.message}".red
        end
      when '6'
        begin
          @@app_tools.favourites
          @@app_tools.remove_favourite
        rescue StandardError => e
          puts "An error occurred: #{e.message}".red
        end
      when '7'
        result = Authentication.logout
        puts result
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end