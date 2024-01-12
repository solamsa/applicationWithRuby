require_relative 'requirements.rb'

class ConnectDB
  def self.connect
    Sequel.connect(adapter: 'postgres', database: 'testDB', user: 'postgres', password: 'test123', host: '127.0.0.1')
    puts "Db connected"
  end
end