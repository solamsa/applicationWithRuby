require '../loader.rb'
require 'rspec'

describe Rating do
  let(:user) { User.create(username: 'new_user', email: 'new_user@example.com', password: 'password') }
  let(:movie) { Movie.create(imdb_id: "tt1375665", title: 'Test_Movie', year: "2010") }

  describe 'validations' do
    it 'is valid with valid attributes' do
      rating = Rating.new(user: user, movie: movie, rating: 4, review: 'Great movie!')
      expect(rating).to be_valid
    end

    it 'is invalid without a rating' do
      rating = Rating.new(user: user, movie: movie, review: 'Great movie!')
      expect(rating).to_not be_valid
    end

  end

  describe 'associations' do
    it 'belongs to a user' do
      association = Rating.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to a movie' do
      association = Rating.reflect_on_association(:movie)
      expect(association.macro).to eq :belongs_to
    end
  end
end