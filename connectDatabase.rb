require_relative 'requirements.rb'

class ConnectDB
  @@db_connection
  def self.connect
    @@db_connection = Sequel.connect(adapter: 'postgres', database: 'testDB', user: 'postgres', password: 'test123', host: '127.0.0.1')
    puts "Db connected"
  end

  def self.connection
    return @@db_connection
  end
end