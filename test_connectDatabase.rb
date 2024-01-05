require 'pg'
require 'sequel'
require_relative 'connectDatabase.rb'

RSpec.describe 'Database Setup' do
  before(:all) do
    # Establish a database connection before running tests
    @db = ConnectDB.connect
  end

  after(:all) do
    # Disconnect from the database after running tests
    @db.disconnect
  end

  it 'handles table creation errors gracefully' do
    # Simulate a scenario where the table creation fails
    allow(@db).to receive(:create_table).and_raise(Sequel::DatabaseError.new('Simulated error'))

    # code that handles the table creation
    begin
      @db.create_table :users do
        primary_key :id
        String :username, size: 255, null: false
        String :email, size: 255, null: false
        String :password_digest, size: 255, null: false
      end
    rescue Sequel::DatabaseError => e
      # Check if the expected error message is received
      expect(e.message).to eq 'Simulated error'
    end
  end
end

