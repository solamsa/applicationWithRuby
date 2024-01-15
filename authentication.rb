require_relative 'requirements.rb'
require_relative 'models/userModel'

class Authentication 

  @@current_user = nil

  def self.current_user
    @@current_user
  end

  def self.register(username, email, password)
    user = User.new(username: username, email: email, password: password)
    if user.valid?
      user.save
      @@current_user = user
      return "Registration successful"
    else
      return "Registration failed. #{user.errors.full_messages.join(', ')}"
    end
  end

  def self.login(username, password)
    user = User.find(username: username)
    if user && user.authenticate(password)
      @@current_user = user
      return "Login successful!"
    else
      return "Login failed. Invalid username or password."
    end
  end


  def self.logout
    @@current_user = nil
    return "Logout successful!"
  end
end

