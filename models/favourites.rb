require_relative '../requirements.rb'
require_relative '../connectDatabase.rb'

class Favourite < Sequel::Model

  many_to_one :user, key: :user_id, class: :User
  many_to_one :movie, key: :movie_id, class: :Movie

  plugin :timestamps, update_on_create: true

  def validate
    super
    validates_presence :user
    validates_presence :movie
    validates_unique [:user_id, :movie_id]
  end
end