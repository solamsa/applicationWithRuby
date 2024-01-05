require_relative 'authentication'

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
    Authentication.register(username, email, password)

  when '2'
    print "Enter username: "
    username = gets.chomp
    print "Enter password: "
    password = gets.chomp
    Authentication.login(username, password)

  when '3'
    break

  else
    puts "Invalid choice. Please try again."
  end
end