require_relative 'requirements.rb'
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

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
     self.password_hash = @password
  end

  def authenticate(user_password)
    stored_password = BCrypt::Password.new(password_hash)
    return stored_password == user_password
  end
end