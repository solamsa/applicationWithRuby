require_relative 'requirements.rb'
require_relative 'models/userModel'
require_relative 'connectDatabase'

class FindMovie

  @@db_connection = ConnectDB.connection

  def getMovies(title)
    ds1 = @@db_connection[:movies]
    ds2 = ds1.where(Sequel.like(:name, 'Inc%'))
    puts ds2
  end
end