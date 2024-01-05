require 'sequel'
require 'bcrypt'
require 'pg'
require_relative 'connectDatabase.rb'

ConnectDB.connect
Sequel::Model.plugin :validation_helpers
class User < Sequel::Model
  include BCrypt
  def validate
    super
    validates_presence :username
    validates_unique :username
    validates_presence :email
    validates_unique :email
    end

  def password=(password)
    @password_digest = password
    self.password_digest = BCrypt::Password.create(password_digest)
  end

  def authenticate(password)
    stored_password = BCrypt::Password.new(password_digest)
    puts "Stored Password: #{stored_password}"
    puts "Provided Password: #{password}"
    stored_password == password
  end
end