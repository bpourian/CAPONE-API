require 'pg'

class Database
  attr_reader  :connection

  def self.query(sql)
    @connection.exec(sql)
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect :dbname => "capital_oneder_test"
    else
      @connection = PG.connect :dbname => "capital_oneder_dev"
    end
  end
end
