require 'pg'
require 'sequel'
DB = Sequel.connect(adapter: 'postgres', database: 'testDB', user: 'postgres', password: 'test123', host: '127.0.0.1')

DB.create_table :users do
    primary_key :id
    String :username, size: 255, null: false
    String :email, size: 255, null: false
    String :password_digest, size: 255, null: false
    end
# users = DB[:users]
# users.insert(username: 'john_doe', email: 'john@example.com')
# result = users.all
# puts result

