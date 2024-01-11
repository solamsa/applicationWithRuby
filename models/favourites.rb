require_relative '../requirements.rb'
require_relative '../connectDatabase.rb'

class Favourite < Sequel::Model

  many_to_one :users
  many_to_one :movies

  plugin :timestamps, update_on_create: true
end