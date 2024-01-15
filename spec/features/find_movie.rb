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
    it 'finds a movie successfully' do
      puts "TODO"
    end

    it 'fails to find a movie' do
      puts "TODO"
    end 
  end
end

