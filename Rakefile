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

    con.exec "DROP TABLE IF EXISTS Citizens"
    con.exec "CREATE TABLE Citizens(id SERIAL PRIMARY KEY,
        salutation VARCHAR(60), first_name VARCHAR(60), last_name VARCHAR(60),
        previous_country VARCHAR(60), gender VARCHAR(60), citizen_id VARCHAR(60));"
    con.close if con
  end
end

task :create_table_citizens_test do
  con = PG.connect :dbname => 'capital_oneder_test'
  con.exec "DROP TABLE IF EXISTS Citizens"
  con.exec "CREATE TABLE Citizens(id SERIAL PRIMARY KEY,
      salutation VARCHAR(60), first_name VARCHAR(60), last_name VARCHAR(60),
       previous_country VARCHAR(60), gender VARCHAR(60), citizen_id VARCHAR(60));"
  con.close if con
end

task :auto_migrate do
  con = PG.connect(dbname: 'postgres://axgbnmwpkantca:cee439cc47ecac16c96d584140476111f236cf5c3823dbae59c7468fad9151c2@ec2-54-228-181-43.eu-west-1.compute.amazonaws.com:5432/d1d5ogor6eaos9')
  con.exec("TRUNCATE Citizens;")

  con.exec "DROP TABLE IF EXISTS Citizens"
  con.exec "CREATE TABLE Citizens(id SERIAL PRIMARY KEY,
      salutation VARCHAR(60), first_name VARCHAR(60), last_name VARCHAR(60),
       previous_country VARCHAR(60), gender VARCHAR(60), citizen_id VARCHAR(60));"

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
