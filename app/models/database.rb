require 'pg'

class Database
  attr_reader  :connection

  def self.query(sql)
    @connection.exec(sql)
  end

  def self.connect
    @connection = PG.connect(ENV['DATABASE_URL'] || "postgres://localhost/#{ENV['RACK_ENV']}")
  end
end
