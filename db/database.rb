require_relative '../requirements.rb'
require_relative '../connectDatabase.rb'
require 'sequel'

DB = ConnectDB.connect

module SQL

  class CreateTables
    def self.create_users
      begin
        DB.create_table :users do
          column :user_id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
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
          column :movie_id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
          String :imdb_id, size: 15, null: false
          String :title, size: 255, null: false
          String :year, size:255
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
          column :rating_id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
          foreign_key :user_id, :users,type: :uuid, key: :user_id, on_delete: :cascade
          foreign_key :movie_id, :movies,type: :uuid, key: :movie_id, on_delete: :cascade
          Float :rating, null: false
          String :review, text: true
          DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
          unique [:user_id, :movie_id]
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
          column :favourite_id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
          foreign_key :user_id, :users, type: :uuid, key: :user_id, on_delete: :cascade
          foreign_key :movie_id, :movies, type: :uuid, key: :movie_id, on_delete: :cascade
          DateTime :deleted_at
          unique [:user_id, :movie_id]
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

