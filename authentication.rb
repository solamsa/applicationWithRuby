require 'bcrypt'
require_relative 'userModel'

class Authentication 
    def self.register(username, email, password)
        user = User.new(username: username, email: email, password: password)
        if user.valid?
            user.save
            puts "Registration successful"
        else
            puts "Registration failed. #{user.errors.full_messages.join(', ')}"
        end
    end

    def self.login(username, password)
        user = User.find(username: username)
        if user && user.authenticate(password)
            puts "Login successful!"
          else
            puts "Login failed. Invalid username or password."
        end
    end
end