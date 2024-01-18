require 'spec_helper'
require 'rspec'

describe Movie do
  describe 'validations' do
    it 'is valid with valid attributes' do
      movie = Movie.new(imdb_id: "tt1375616", title: 'New Movie', year: "2010")
      expect(movie).to be_valid
    end

    it 'is invalid without a title' do
      movie = Movie.new(year: "2010", genre: 'Action')
      expect(movie).to_not be_valid
    end
  end
end