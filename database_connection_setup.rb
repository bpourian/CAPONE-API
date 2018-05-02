require './app/models/database'

if ENV['DATABASE_URL']
  DatabaseConnection.setup('postgres://axgbnmwpkantca:cee439cc47ecac16c96d584140476111f236cf5c3823dbae59c7468fad9151c2@ec2-54-228-181-43.eu-west-1.compute.amazonaws.com:5432/d1d5ogor6eaos9')
elsif ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('postgres://localhost/capital_oneder_test')
else
  DatabaseConnection.setup('postgres://localhost/capital_oneder_dev')
end
