require_relative '../requirements.rb'
require_relative '../connectDatabase.rb'

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

    def self.create_movies
      begin
        DB.create_table :movies do
          primary_key :movie_id
          String :imdb_id, size: 15, null: false
          String :title, size: 255, null: false
          String :type, size: 255
          String :genre, size: 255
          String :description, text: true
          String :poster, text: true
        end
      rescue Sequel::DatabaseError => e 
        puts e.message
      else
        puts "Sucessfully added movies table!"
      ensure
        DB.disconnect
      end
    end
    
    def self.create_ratings
      begin
        DB.create_table :ratings do
          primary_key :rating_id
          foreign_key :user_id, :users, key: :id, on_delete: :cascade
          foreign_key :movie_id, :movies, key: :movie_id, on_delete: :cascade
          Float :rating, null: false
          String :review, text: true
          DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
      end
      rescue Sequel::DatabaseError => e 
        puts e.message
      else
        puts "Sucessfully added ratings table!"
      ensure
        DB.disconnect
      end
    end

    def self.create_favourites
      begin
        DB.create_table :favourites do
          primary_key :favorite_id
          foreign_key :user_id, :users, key: :id, on_delete: :cascade
          foreign_key :movie_id, :movies, key: :movie_id, on_delete: :cascade
      end
      rescue Sequel::DatabaseError => e 
        puts e.message
      else
        puts "Sucessfully added favourites table!"
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


# SQL::CreateTables.create_users
# SQL::CreateTables.create_movies
# SQL::CreateTables.create_favourites
# SQL::CreateTables.create_ratings

