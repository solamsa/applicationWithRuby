require 'pg'
require 'sequel'
require_relative 'connectDatabase.rb'

begin
  DB.create_table :users do
    primary_key :id
    String :username, size: 255, null: false
    String :email, size: 255, null: false
    String :password_digest, size: 255, null: false
  end
rescue Sequel::DatabaseError => e 
  puts e.message
else
  puts "Sucessfully added users table!"
ensure
  DB.disconnect
end

# users = DB[:users]
# users.insert(username: 'john_doe', email: 'john@example.com')
# result = users.all
# puts result

