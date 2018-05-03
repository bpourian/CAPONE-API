require 'pg'

class Database
  attr_reader  :connection

  def self.query(sql)
    @connection.exec(sql)
  end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect :dbname => "capital_oneder_test"

      elsif ENV['DATABASE_URL']
        @connection = PG.connect :dbname => "postgresql-reticulated-68763"

      else ENV['RACK_ENV'] == 'development'
        @connection = PG.connect :dbname => "capital_oneder_dev"
    end
  end
end
