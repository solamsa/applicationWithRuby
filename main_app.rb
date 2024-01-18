require_relative 'features/authentication'
require 'json'
require_relative 'app_options'
require 'colorize'

class MyApp

  def runApp
    loop do
      puts "1. Register".blue
      puts "2. Login".blue
      puts "3. Exit".red
      choice = gets.chomp
        
      case choice
      when '1'
        print "Enter username: "
        username = gets.chomp
        print "Enter email: "
        email = gets.chomp
        print "Enter password: "
        password = gets.chomp
        result = Authentication.register(username, email, password)
        puts result

      when '2'
        print "Enter username: "
        username = gets.chomp
        print "Enter password: "
        password = gets.chomp
        result = Authentication.login(username, password)
        current_user = Authentication.current_user
        puts "#{result}"
        app_options = AppOptions.new
        if current_user
          app_options.operate
        else
          runApp
        end

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

my_app = MyApp.new
my_app.runApp