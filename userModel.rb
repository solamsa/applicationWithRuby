require 'sequel'
require 'bcrypt'
require 'pg'
require_relative 'connectDatabase.rb'

Sequel::Model.plugin :validation_helpers
class User < Sequel::Model
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
    BCrypt::Password.new(password_digest) == password
  end
end