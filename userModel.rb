require 'sequel'
require 'bcrypt'
require 'pg'
DB = Sequel.connect(adapter: 'postgres', database: 'testDB', user: 'postgres', password: 'test123', host: '127.0.0.1')
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
        self.password_digest = Bcrypt::Password.create(password_digest)
    end

    def authenticate(password)
        BCrypt::Password.new(password_digest) == password
      end
end