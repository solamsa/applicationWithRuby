require_relative 'requirements.rb'
require_relative 'connectDatabase.rb'

DB = ConnectDB.connect

module SQL

  class CreateTables
    def self.create_users
      begin
        DB.create_table :users do
          primary_key :id
          String :username, size: 255, null: false
          String :email, size: 255, null: false
          String :password_hash, size: 255, null: false
        end
      rescue Sequel::DatabaseError => e 
        puts e.message
      else
        puts "Sucessfully added users table!"
      ensure
        DB.disconnect
      end
    end
  end

  class ManupulateData
    def self.remove_user_by_username(name_to_remove)
      begin
        users_table = DB[:users]
        users_table.where(username: name_to_remove).delete
        puts "Sucessfully deleted #{name_to_remove} from table!"
      rescue Sequel::DatabaseError => e 
        puts e.message
      ensure
        DB.disconnect
      end
    end
  end
end


