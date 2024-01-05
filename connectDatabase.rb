require 'sequel'
DB = Sequel.connect(adapter: 'postgres', database: 'testDB', user: 'postgres', password: 'test123', host: '127.0.0.1')