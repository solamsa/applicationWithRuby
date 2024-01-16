require 'spec_helper'
require 'rspec'

describe Favourite do


  describe 'validations' do
    it 'is valid with valid attributes' do
      user =  User.create(username: 'asp_user', email: 'asp_user@example.com', password: 'password')
      movie = Movie.create(imdb_id: "tt1375665", title: 'Test_Movie', year: "2010")
      favourite = Favourite.new(user: user, movie: movie)
      expect(favourite).to be_valid
    end

    it 'is invalid without a rating' do
      user =  User.create(username: 'q_user', email: 'q_user@example.com', password: 'password')
      movie = Movie.create(imdb_id: "tt1375663", title: 'Tst_Movie', year: "2010")
      rating = Favourite.new(user: user)
      expect(rating).to_not be_valid
    end

  end

  describe 'associations' do
    it 'belongs to a user' do
      user =  User.create(username: 'as_user', email: 'as_user@example.com', password: 'password')
      association = Favourite.association_reflection(:user)
      expect(association[:type]).to eq :many_to_one

    end

    it 'belongs to a movie' do
      movie = Movie.create(imdb_id: "tt1375661", title: 'Test_Movie', year: "2010")
      association = Favourite.association_reflection(:movie)
      expect(association[:type]).to eq :many_to_one
    end
  end
end