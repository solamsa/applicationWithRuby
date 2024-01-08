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
    result = Authentication.register(username, email, password)
    puts result

  when '2'
    print "Enter username: "
    username = gets.chomp
    print "Enter password: "
    password = gets.chomp
    result = Authentication.login(username, password)
    puts result

  when '3'
    break

  else
    puts "Invalid choice. Please try again."
  end
end