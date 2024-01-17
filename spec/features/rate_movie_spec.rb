require 'spec_helper'
require 'rspec'
require 'stringio'
require 'pry'

RSpec.describe SaveMovie do
let(:output) { StringIO.new }

  before do
    allow($stdout).to receive(:puts) {|msg| output.puts(msg)}
  end


  before(:each) do
    Authentication.register('b_user','b@gmail.com', 'testpass')
    Authentication.login('b_user', 'testpass')
    movie = Movie.new(imdb_id: "tt1375661", title: 'ABC', year: "2010")
    result = SaveMovie.save(movie)
  end

  describe '.save' do
    it 'saves a movie to favourites successfully' do
      find_movie = FindMovie.new
      find_movie.find_movies("ABC%")
      movie = find_movie.get_movies.first
      movie_instance = Movie[movie[:movie_id]]
      result = RateMovie.save(movie_instance,4.5)
      expect(result).to eq("Successfully rated movie")
    end
  end
end