require_relative '../loader.rb'
require 'rspec'
require 'stringio'

RSpec.describe Authentication do
let(:output) { StringIO.new }

  before do
    allow($stdout).to receive(:puts) {|msg| output.puts(msg)}
  end

  after(:all) do
    SQL::ManupulateData.remove_user_by_username("test_user")
  end

  describe '.register' do
    it 'registers a user successfully' do
      result = Authentication.register('test_user','test@gmail.com', 'testpass')
      expect(result).to eq("Registration successful")
      # SQL::ManupulateData.remove_user_by_username("test_user")
    end

    it 'fails to register a user with invalid data' do
      result = Authentication.register('test_user', 'test@example.com', 'password123')
      expect(result).to eq("Registration failed. username is already taken")
    end 
  end

  describe '.login' do
    it 'logs in successfully with correct credentials' do
      # Assuming you have registered a user with these credentials first
      result = Authentication.login('test_user', 'testpass')
      expect(result).to eq("Login successful!")
    end

    it 'fails to log in with incorrect credentials' do
      result = Authentication.login('nonexistent_user', 'incorrect_password')
      expect(result).to eq("Login failed. Invalid username or password.")
    end
  end
end

