require 'bcrypt'
require_relative 'userModel'

class Authentication 
    def self.register(username, email, password)
        user = User.new(username: username, email: email, password: password)
    end
end