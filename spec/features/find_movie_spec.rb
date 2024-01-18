require 'spec_helper'
require 'rspec'
require 'stringio'
require 'colorize'

RSpec.describe FindMovie do
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
    it 'finds a movie successfully' do
      find_movie = FindMovie.new
      result = find_movie.find_movies("ABC%")
      expect(result).to eq("Successfully found related movies".bold)
    end

    it 'no match found' do
      find_movie = FindMovie.new
      result = find_movie.find_movies("ECD%")
      expect(result).to eq("No matching movies")
    end
  end
end

