require 'spec_helper'
require 'rspec'
require 'stringio'

RSpec.describe SaveMovie do
let(:output) { StringIO.new }

  before do
    allow($stdout).to receive(:puts) {|msg| output.puts(msg)}
  end


  before(:each) do
    Authentication.register('b_user','b@gmail.com', 'testpass')
    Authentication.login('b_user', 'testpass')
  end

  describe '.save' do
    it 'saves a movie successfully' do
      movie = Movie.new(imdb_id: "tt1375666", title: 'Inception', year: "2010")
      result = SaveMovie.save(movie)
      expect(result).to eq("Successfully saved a movie")
    end

    it 'fails to save same movie' do
      movie = Movie.new(imdb_id: "tt1375666", title: 'Inception', year: "2010")
      result = SaveMovie.save(movie)
      expect(result).to eq("Save failed, movie already exist")
    end 
  end
end

