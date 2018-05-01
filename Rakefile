require 'pg'

task :test_database_setup do
  con = PG.connect(dbname: 'capital_oneder_test')
  con.exec("TRUNCATE Citizens;")
  con.close if con
end

task :dev_database_setup do
  con = PG.connect(dbname: 'capital_oneder_dev')
  con.exec("TRUNCATE Citizens;")
  con.close if con
end

task :create_table_citizens do
  ['capital_oneder_test', 'capital_oneder_dev'].each do |database|
    con = PG.connect :dbname => database

    con.exec "DROP TABLE IF EXISTS Snacks"
    con.exec "CREATE TABLE Citizens(Id INTEGER PRIMARY KEY,
        Salutation VARCHAR(20), First_Name VARCHAR(20), Last_Name VARCHAR(20),
         Previous_Country VARCHAR(20), Gender VARCHAR(20));"
    con.close if con
  end
end

task :setup do
  p "Creating test and dev databases..."

  ['capital_oneder_test', 'capital_oneder_dev'].each do |database|
    con = PG.connect
    con.exec "DROP DATABASE IF EXISTS #{ database }"
    con.exec("CREATE DATABASE #{ database };")
    con.close if con
  end

  Rake::Task[:create_table_citizens].invoke
end
