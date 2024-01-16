require_relative 'features/authentication'
require 'json'
require_relative 'app_options'

class MyApp

  def runApp
    loop do
      puts "1. Register"
      puts "2. Login"
      puts "3. Exit"
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
        puts result
        app_options = AppOptions.new
        app_options.operate

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